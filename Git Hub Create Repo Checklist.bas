@echo off
setlocal enabledelayedexpansion
title Github Repo Step-by-Step Checklist with Timestamp Log
color 03

:: ===== Ask for User Info =====
:askUsername
set "USERNAME="
set /p "USERNAME=Enter Username (required): "
if "!USERNAME!"=="" (
    echo Username cannot be empty.
    goto askUsername
)

set /p "POSITION=Enter Position (optional): "

:: Create log folder if not exist
set "LOGFOLDER=logs"
if not exist "%LOGFOLDER%" mkdir "%LOGFOLDER%"

:: Build log file name (based on start time)
for /f "tokens=2-4 delims=/ " %%a in ("%date%") do (
    set "dd=%%a"
    set "mm=%%b"
    set "yy=%%c"
)
for /f "tokens=1-3 delims=:." %%a in ("%time%") do (
    set "hh=%%a"
    set "nn=%%b"
    set "ss=%%c"
)
if "!hh:~0,1!"==" " set "hh=0!hh:~1,1!"
set "LOGFILE=%LOGFOLDER%\vba_update_%USERNAME%_!yy!-!mm!-!dd!_!hh!!nn!!ss!.txt"

:: Define steps
set "step[1]=GitHub Repo Session Started"
set "step[2]=Step 1 Draft description by sections"
set "step[3]=Step 2 GPT - readme, devguide, userguide"
set "step[4]=Step 3 Generalize template.xlsm"
set "step[5]=Step 4 Export all modules to src"
set "step[6]=Step 5 Create repo, fill details, upload files"
set "step[7]=Step 6 Produce example files"
set "step[8]=Step 7 GPT - tests files"
set "step[9]=Step 8 completed Pushed to GitHub"
set "step[10]=Step 9 completed Created GitHub release"
set "step[11]=VBA Update Session Finished"

:: ===== Detect Total Steps =====
set "MAXSTEP=0"
for /f "tokens=1 delims==" %%A in ('set step[') do (
    set "var=%%A"
    set "num=!var:step[=!"
    set "num=!num:]=!"
    if !num! gtr !MAXSTEP! set "MAXSTEP=!num!"
)

echo =============================================================
echo     Github Repo CHECKLIST - Press any key for next step
echo === Session Started by %USERNAME% (%POSITION%) ===
echo     Session log will be saved as: %LOGFILE%
echo =============================================================
echo.

:: Loop through steps
for /l %%i in (1,1,%MAXSTEP%) do (
    call :LogStep "!step[%%i]!"
    pause >nul
)
exit /b

:LogStep
setlocal enabledelayedexpansion
:: Get current date/time
for /f "tokens=2-4 delims=/ " %%a in ("%date%") do (
    set "cdd=%%a"
    set "cmm=%%b"
    set "cyy=%%c"
)
for /f "tokens=1-3 delims=:." %%a in ("%time%") do (
    set "chh=%%a"
    set "cnn=%%b"
    set "css=%%c"
)
if "!chh:~0,1!"==" " set "chh=0!chh:~1,1!"
set "css=!css:~0,2!"

:: Output
echo [!cyy!-!cmm!-!cdd! !chh!:!cnn!:!css!] %~1
>> "%LOGFILE%" echo [!cyy!-!cmm!-!cdd! !chh!:!cnn!:!css!] %~1
endlocal
exit /b
