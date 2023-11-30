@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute %0, "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

REM Define directories
SET INPUT_DIR=Input
SET OUTPUT_DIR=Output

REM Create Input and Output directories if they don't exist
IF NOT EXIST "%INPUT_DIR%" mkdir "%INPUT_DIR%"
IF NOT EXIST "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

REM Check if FFmpeg is installed and up to date
ffmpeg -version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO FFmpeg not found or not up to date.

    REM Check if Chocolatey is installed
    where choco >nul 2>&1
    IF %ERRORLEVEL% NEQ 0 (
        ECHO Chocolatey not found. Attempting to download and install...

        REM Using curl to download Chocolatey install script
        curl -L https://chocolatey.org/install.ps1 -o install_choco.ps1

        REM Run the install script with PowerShell
        PowerShell -NoProfile -ExecutionPolicy Bypass -File install_choco.ps1

        REM Delete the install script after installation
        del install_choco.ps1

        ECHO Chocolatey installation complete.
    ) ELSE (
        ECHO Chocolatey is already installed.
    )

    REM Install or Update FFmpeg using Chocolatey
    ECHO Installing or updating FFmpeg...
    choco install ffmpeg-full -y

    ECHO FFmpeg installation or update complete.
) ELSE (
    ECHO FFmpeg is installed and up to date.
)

REM Process each .mov file in the Input directory
FOR %%F IN ("%INPUT_DIR%\*.mov") DO (
    ECHO Processing %%~nxF...
    ffmpeg -i "%%F" -vf "split [a], pad=iw*2:ih [b], [a] alphaextract, scale=iw:ih, [b] overlay=w, scale=iw/2:ih" -c:v libx265 -crf 23 -y "%OUTPUT_DIR%\%%~nF.mp4"
    ECHO Done processing %%~nxF.
)

ECHO All files processed.
