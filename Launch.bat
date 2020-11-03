@echo off
chcp 65001
net session >nul 2>&1
if %errorLevel% == 1 (
echo Please run as administrator
goto :eof
)
for %%a in ("%~dp0") do set parent=%%~dpa
takeown /f "%parent%." /r /d n
cacls "%parent%." /t /e /p administrators:f
cacls "%parent%." /t /e /p users:f
start "" "%~dp0AutoHotkey.exe" "%~dp0Utility.ahk"
exit