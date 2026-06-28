@echo off
setlocal enableextensions enabledelayedexpansion
title Anno 1404 HE - Japanese Patch

rem ============================================================
rem  Anno 1404 History Edition - Japanese localization patcher
rem  Rebuilds a Japanese eng0.rda from the ORIGINAL English one.
rem  Usage:
rem    apply_jp.bat                  ... use default Steam path
rem    apply_jp.bat "D:\...\Anno 1404 - History Edition"
rem    (or drag the game folder onto apply_jp.bat)
rem  Messages are ASCII on purpose (cmd.exe mis-parses non-ASCII
rem  batch text). Full Japanese guide is in README.txt.
rem ============================================================

set "TOOL=%~dp0"
set "RDA=%TOOL%RdaConsole.exe"

set "GAME=%~1"
if "%GAME%"=="" set "GAME=C:\Program Files (x86)\Steam\steamapps\common\Anno 1404 - History Edition"
set "MAIN=%GAME%\maindata"
set "ORIG=%MAIN%\eng0.rda.ORIGINAL"
set "BUILD=%TOOL%_build"
set "NEWRDA=%TOOL%eng0_new.rda"
set "ENSIZE=532347479"
set "CHECK=%BUILD%\data\loca\eng\txt\interface.txt"

echo ============================================================
echo  Anno 1404 HE - Japanese Patch
echo  Game: "%GAME%"
echo ============================================================
echo.

if not exist "%RDA%" goto :no_rda
if not exist "%MAIN%\eng0.rda" goto :no_game

rem ---- [1/5] back up the original once ----
if exist "%ORIG%" (
  echo [1/5] Backup OK ^(eng0.rda.ORIGINAL already exists^)
  goto :do_extract
)
for %%F in ("%MAIN%\eng0.rda") do set "CURSIZE=%%~zF"
if not "!CURSIZE!"=="%ENSIZE%" goto :not_original
echo [1/5] Backing up original to eng0.rda.ORIGINAL ...
copy /y "%MAIN%\eng0.rda" "%ORIG%" >nul
if errorlevel 1 goto :fail_backup

:do_extract
rem ---- [2/5] extract the original English archive ----
echo [2/5] Extracting original English archive...
echo       This takes a few minutes. The screen may clear - that is normal.
echo       Please wait, do NOT close this window.
if exist "%BUILD%" rmdir /s /q "%BUILD%"
"%RDA%" extract -f "%ORIG%" -o "%BUILD%" -y
if not exist "%CHECK%" "%RDA%" extract -f "%ORIG%" -o "%BUILD%" -y -n
if not exist "%CHECK%" goto :fail_extract
echo       ...extract done.

rem ---- [3/5] overlay Japanese files ----
echo [3/5] Overlaying Japanese files ...
xcopy /e /y /i "%TOOL%jp_files\data" "%BUILD%\data" >nul
if errorlevel 1 goto :fail_overlay

rem ---- [4/5] repack into a full Japanese archive ----
echo [4/5] Repacking the Japanese archive...
echo       This takes a few minutes. Please wait, do NOT close this window.
if exist "%NEWRDA%" del /q "%NEWRDA%"
pushd "%BUILD%"
"%RDA%" pack -v 1 -r -f data -o "%NEWRDA%" -y
if not exist "%NEWRDA%" "%RDA%" pack -v 1 -r -f data -o "%NEWRDA%" -y -n
popd
if not exist "%NEWRDA%" goto :fail_pack
echo       ...repack done.

rem ---- [5/5] install into the game ----
echo [5/5] Installing into the game ...
copy /y "%NEWRDA%" "%MAIN%\eng0.rda" >nul
if errorlevel 1 goto :fail_install

rmdir /s /q "%BUILD%"
echo.
echo ============================================================
echo  [OK] Japanese patch applied. Launch the game to check.
echo       To revert to English, run restore_en.bat
echo ============================================================
goto :end

:no_rda
echo [ERROR] RdaConsole.exe not found next to this script:
echo   "%RDA%"
goto :end
:no_game
echo [ERROR] Could not find the game's eng0.rda at:
echo   "%MAIN%\eng0.rda"
echo.
echo If your game is installed elsewhere, drag the game folder onto
echo apply_jp.bat, or run from a command prompt:
echo   apply_jp.bat "D:\path\to\Anno 1404 - History Edition"
goto :end
:not_original
echo [WARN] The current eng0.rda is NOT the original English size.
echo   size    = !CURSIZE!
echo   expected= %ENSIZE%
echo It may already be patched. Aborting so the original is not lost.
echo Use Steam "Verify integrity of game files" to restore English,
echo then run this again.
goto :end
:fail_backup
echo [ERROR] Backup failed (could not copy eng0.rda).
goto :end
:fail_extract
echo [ERROR] Extract failed (no files were produced).
goto :end
:fail_overlay
echo [ERROR] Overlay failed (xcopy of jp_files).
goto :end
:fail_pack
echo [ERROR] Repack failed (eng0_new.rda was not created).
goto :end
:fail_install
echo [ERROR] Install failed (could not copy into the game folder).
echo Close the game / Steam and try again.
goto :end

:end
echo.
pause
endlocal
