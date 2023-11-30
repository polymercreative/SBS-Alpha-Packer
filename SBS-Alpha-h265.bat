@echo off

REM Define directories
SET INPUT_DIR=Input
SET OUTPUT_DIR=Output

REM Create Input and Output directories if they don't exist
IF NOT EXIST "%INPUT_DIR%" mkdir "%INPUT_DIR%"
IF NOT EXIST "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"


REM Process each .mov file in the Input directory
FOR %%F IN ("%INPUT_DIR%\*.mov") DO (
    ECHO Processing %%~nxF...
    ffmpeg -i "%%F" -vf "split [a], pad=iw*2:ih [b], [a] alphaextract, [b] overlay=w" -c:v libx265 -crf 23 -y "%OUTPUT_DIR%\%%~nF.mp4"
    ECHO Done processing %%~nxF.
)

ECHO All files processed.
