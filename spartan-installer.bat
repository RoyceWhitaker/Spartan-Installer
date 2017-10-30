@echo off
Title *SRS Software Installer*

setlocal ENABLEDELAYEDEXPANSION & set "_FilePath=%~1"
  if NOT EXIST "!_FilePath!" (echo/Starting AdminElevation)
  set "_FN=_%~ns1" & echo/%TEMP%| findstr /C:"(" >nul && (echo/ERROR: %%TEMP%% path can not contain parenthesis &pause &endlocal &fc;: 2>nul & goto:eof)
  set _FN=%_FN:(=%
  set _vbspath="%temp:~%\%_FN:)=%.vbs" & set "_batpath=%temp:~%\%_FN:)=%.bat"
  >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
  if "%errorlevel%" NEQ "0" goto :_getElevation
  (if exist %_vbspath% ( del %_vbspath% )) & (if exist %_batpath% ( del %_batpath% )) 
  endlocal & CD /D "%~dp1" & ver >nul & goto:eof
  :_getElevation
  echo/Requesting elevation...
  echo/Set UAC = CreateObject^("Shell.Application"^) > %_vbspath% || (echo/&echo/Unable to create %_vbspath% & endlocal &md; 2>nul &goto:eof) 
  echo/UAC.ShellExecute "%_batpath%", "", "", "runas", 1 >> %_vbspath% & echo/wscript.Quit(1)>> %_vbspath%
  echo/@%* > "%_batpath%" || (echo/&echo/Unable to create %_batpath% & endlocal &md; 2>nul &goto:eof)
  echo/@if %%errorlevel%%==9009 (echo/Admin user could not read the batch file. If running from a mapped drive or UNC path, check if Admin user can read it.) ^& @if %%errorlevel%% NEQ 0 pause >> "%_batpath%"
  %_vbspath% && (echo/&echo/Failed to run VBscript %_vbspath% &endlocal &md; 2>nul & goto:Ask)
  echo/&echo/Elevation was requested on a new CMD window &endlocal &fc;: 2>nul & goto:Ask

goto:Ask
:Ask
cls
echo                           SRS Software Installer
echo [-----------------------------------------------------------------------------]
echo [                                                                             ]
echo [                 We will begin downloading required software.                ]
echo [      Copyright (c) 2017 Associated Student - San Jose State University      ]
echo [                                                                             ]
echo [-----------------------------------------------------------------------------]
echo.
set INPUT=
set /P INPUT= Ready? (Y/N): %=%
If /I "%INPUT%"=="y" goto yes 
If /I "%INPUT%"=="n" goto no
If /I "%INPUT%"=="Y" goto yes 
If /I "%INPUT%"=="N" goto no
echo Incorrect input & goto Ask
:yes
Cls
md temp
cd temp
cls
echo %time% Please Wait Downloading Required Program Files
echo [#             ]
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/RoyceWhitaker/Spartan-Installer/raw/master/Programs/flash.exe', 'flash.exe')"
cls
echo %time% Please Wait Downloading Required Program Files
echo [##            ]
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/RoyceWhitaker/Spartan-Installer/raw/master/Programs/ChromeSetup.exe', 'ChromeSetup.exe')"
cls
echo %time% Please Wait Downloading Required Program Files
echo [###           ]
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/RoyceWhitaker/Spartan-Installer/raw/master/Programs/Firefox%20Installer.exe', 'FirefoxInstaller.exe')"
cls
echo %time% Please Wait Downloading Required Program Files
echo [####          ]
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/RoyceWhitaker/Spartan-Installer/raw/master/Programs/7z-x32.exe', '7z-x32.exe')"
cls
echo %time% Please Wait Downloading Required Program Files
echo [#####         ]
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/RoyceWhitaker/Spartan-Installer/raw/master/Programs/7z-x64.exe', '7z-x64.exe')"
cls
echo %time% Please Wait Downloading Required Program Files
echo [######        ]
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/RoyceWhitaker/Spartan-Installer/raw/master/Programs/mb3.exe', 'mb3.exe')"
cls
echo %time% Please Wait Downloading Required Program Files
echo [#######       ]
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/RoyceWhitaker/Spartan-Installer/raw/master/Programs/vlc.exe', 'vlc.exe')"
cls
echo %time% Please Wait Program Downloading Required Files
echo [##############]


cls
title *SRS* Associated Students
::------Create and switch to folder------




::------Return To Menu------
SET RETURN=Return
:Return
::------Return To Menu------



::===============================Main Menu==========================================
title *SRS Software Installer* By: Associated Students
cls
echo                             Main Menu
echo *******************************************************************************
echo *                                                                             *
echo *  Enter 1 To begin installing the software                                   *
echo *                                                                             *
echo *  Software: Chrome, Firefox, Flash Player, Malwarebytes, VLC, 7Zip           *
echo *                                                                             *
echo *  Enter 9 To Exit Without Installing                                         *
echo *                                                                             *
echo *******************************************************************************
set input=
set /p input= Enter Option %=%
if %input%==1 goto installchrome
if %input%==9 goto z
echo Incorrect input & goto %RETURN%


:installchrome
cls
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT 
echo %time% Loading the Google Chrome Installer
call ChromeSetup.exe
GOTO installfirefox
:64BIT
echo %time% Loading the Google Chrome Installer
call ChromeSetup.exe
GOTO installfirefox

:installfirefox
cls
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT 
echo %time% Loading the Firefox Installer
call FirefoxInstaller.exe
GOTO installflash
:64BIT
echo %time% Loading the Firefox Installer
call FirefoxInstaller.exe
GOTO installflash



:installflash
cls
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT 
echo %time% Loading the Flash Player Installer
call flash.exe
GOTO installmalwarebytes
:64BIT
echo %time% Loading the Flash Player Installer
call flash.exe
GOTO installmalwarebytes


:installmalwarebytes
cls
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT 
echo %time% Loading the Malwarebytes Installer
call mb3.exe
GOTO installvlc
:64BIT
echo %time% Loading the Malwarebytes Installer
call mb3.exe
GOTO installvlc


:installvlc
cls
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT 
echo %time% Loading the VLC Installer
call vlc.exe
GOTO install7zip
:64BIT
echo %time% Loading the VLC Installer
call ClchromeSetup.exe
GOTO install7zip




:install7zip
cls
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT 
echo %time% Loading the Google Chrome Installer
call 7zip-x32.exe
GOTO z
:64BIT
echo %time% Loading the Google Chrome Installer
call 7zip-x64.exe
GOTO z


:z
cls
echo                            Closing Application
echo *******************************************************************************

dir
cd ../
dir
TIMEOUT /T 1
cls
echo                            Closing Application
echo *******************************************************************************
echo %time% Cleaning up temporary files... Please Wait.
RD temp /S
TIMEOUT /T 2

exit



:no
exit
