@echo off
Title *SRS Software Installer*
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
title *SRS* By: Associated Students
cls
echo                             Main Menu
echo *******************************************************************************
echo *                                                                             *
echo *  Enter 1 To begin installing the software                                   *
echo *                                                                             *
echo *  Chrome, Firefox, Flash Player, Malwarebytes, VLC, 7Zip                     *
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
call firefox-installer.exe
GOTO installfirefox
:64BIT
eecho %time% Loading the Firefox Installer
call firefox-installer.exe
GOTO installfirefox



:installflash
cls
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT 
echo %time% Loading the Flash Player Installer
call flash.exe
GOTO installmalwarebytes
:64BIT
eecho %time% Loading the Flash Player Installer
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
eecho %time% Loading the Malwarebytes Installer
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
eecho %time% Loading the VLC Installer
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
eecho %time% Loading the Google Chrome Installer
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
echo %time% Cleaning up temporary files...
RD temp /S
TIMEOUT /T 2

exit



:no
exit