@echo off
setlocal enableextensions
title Anno 1404 HE - Restore English

set "GAME=%~1"
if "%GAME%"=="" set "GAME=C:\Program Files (x86)\Steam\steamapps\common\Anno 1404 - History Edition"
set "MAIN=%GAME%\maindata"

if not exist "%MAIN%\eng0.rda.ORIGINAL" (
  echo [ERROR] Backup eng0.rda.ORIGINAL not found.
  echo         Use Steam "Verify integrity of game files" to restore English.
  pause & exit /b 1
)
copy /y "%MAIN%\eng0.rda.ORIGINAL" "%MAIN%\eng0.rda" >nul || (echo [ERROR] restore failed & pause & exit /b 1)
echo [OK] Reverted to English.
pause
