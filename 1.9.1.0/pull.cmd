@echo off
for /F "tokens=4 delims= " %%i in ('chcp') do set OLD_CP=%%i
chcp 65001

SET LANG=el_GR
SET "BASE_PATH=%~dp0"
SET "OUT_PATH=%BASE_PATH%\out"

if not EXIST "%OUT_PATH%" mkdir "%OUT_PATH%"

tx pull -l %LANG% %*

for %%I in ("%BASE_PATH%\%LANG%\*.csv") do findstr /V /C:",\"\"" "%%~fI" > "%OUT_PATH%\%LANG%\%%~nxI"

for %%I in ("%OUT_PATH%\%LANG%\*.csv") do (
  if NOT EXIST "%BASE_PATH%\%LANG%\%%~nxI" del "%%~fI"
)

chcp %OLD_CP%
set OLD_CP=