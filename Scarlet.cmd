@echo off
title Existence

set "csfolder="

for /d %%x in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%x\content" (
        set "csfolder=%%x"
        set "Directory=Local AppData"
        goto :existenceMain
    )
)

for /d %%x in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%x\content" (
        set "csfolder=%%x"
        set "Directory=Program Files"
        goto :existenceMain
    )
)

for /d %%x in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%x\content" (
        set "csfolder=%%x"
        set "Directory=Program Files (x86)"
        goto :existenceMain
    )
)
echo Roblox was not found in any location, please re-install your Roblox.
timeout /t 2 >nul
exit

:existenceMain
cls
echo Existence
echo.
echo A Roblox death sound changer
echo.
echo Roblox directory: %Directory%
echo.
echo [1] oof sound
echo [2] yippe sound
echo [3] exit
echo.

set /p key="Enter your option: "
if "%key%"=="1" (
    goto oofsound
)
if "%key%"=="2" (
    goto yippesound
)
if "%key%"=="3" (
    exit
)
echo Option not valid, please try again.
pause
goto existenceMain

:oofsound
cls
echo Downloading oof sound...
powershell -command "& { Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/nulasw/Existence/main/oof_sound.ogg' -OutFile '%csfolder%\content\sounds\ouch.ogg' }"
if %errorlevel% equ 0 (
    echo Success
    pause
    goto existenceMain
) else (
    echo Failed to download oof sound.
    pause
    goto existenceMain
)

:yippesound
cls
echo Downloading yippe sound...
powershell -command "& { Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/nulasw/Existence/main/yippe_sound.ogg' -OutFile '%csfolder%\content\sounds\ouch.ogg' }"
if %errorlevel% equ 0 (
    echo Success
    pause
    goto existenceMain
) else (
    echo Failed to download yippe sound.
    pause
    goto existenceMain
)
