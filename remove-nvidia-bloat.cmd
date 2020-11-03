@setlocal DisableDelayedExpansion
@echo off
REM Check OS, PS and the default nVidia install paths
set "SysPath=%SystemRoot%\System32"
if exist "%SystemRoot%\Sysnative\reg.exe" (set "SysPath=%SystemRoot%\Sysnative")
set "Path=%SysPath%;%SystemRoot%;%SysPath%\Wbem;%SysPath%\WindowsPowerShell\v1.0\"
set "_err==== PROBLEM ===="
set "xOS=x64"
set "_ComSpec=%SystemRoot%\System32\cmd.exe"
set "_Common=%CommonProgramFiles(x86)%"
set "_Program=%ProgramFiles%"
if /i %PROCESSOR_ARCHITECTURE%==x86 (if defined PROCESSOR_ARCHITEW6432 (
  set "_ComSpec=%SystemRoot%\Sysnative\cmd.exe"
  set "_Common=%CommonProgramW6432%"
  set "_Program=%ProgramW6432%"
  ) else (
  set "xOS=x86"
  )
)

REM Put this file into the extracted driver folder and execute (double-click) it. 
REM Check "Telemetry/Outdated/Folders/Removal.png" which shows your what is safe to remove. 
REM In-depth explanation: "nVidia-modded-Inf/blob/master/Docs/nVidia Driver package structure/Driver.md"
REM Linux driver is perfectly fine and clean
rd /s /q Display.NView
rd /s /q Display.Update
rd /s /q DisplayDriverCrashAnalyzer
rd /s /q GFExperience
rd /s /q GFExperience.NvStreamSrv
rd /s /q GfExperienceService
rd /s /q LEDVisualizer
rd /s /q Miracast.VirtualAudio
rd /s /q MS.NET
rd /s /q Network.Service
rd /s /q NV3DVision
rd /s /q NV3DVisionUSB.Driver
rd /s /q NvCamera
rd /s /q NvVAD
rd /s /q NvAbHub
rd /s /q NVWMI
rd /s /q NvvHCI
rd /s /q NvContainer
rd /s /q ShadowPlay
rd /s /q ShieldWirelessController
rd /s /q Update.Core
rd /s /q nodejs
rd /s /q NvBackend
rd /s /q NvTelemetry

REM Optional
rd /s /q MSVCRT
rd /s /q Display.Optimus
rd /s /q NGXCore

REM remove all logs
rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2. DLL",UninstallPackage 

