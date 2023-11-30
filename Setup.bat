@echo off


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

ECHO =====================================
ECHO Setup complete. Press any key to exit.
PAUSE >nul