@echo off
for /F "tokens=4 delims= " %%i in ('chcp') do set OLD_CP=%%i
chcp 65001

SET LANG=el_GR
SET BASE_PATH="%~dp0"

tx pull -l %LANG% %*

for %%I in ("%BASE_PATH%\%LANG%\*.csv") do findstr /V /C:",\"\"" "%%~fI" > "..\www\app\locale\%LANG%\%%~nxI"

for %%I in ("..\www\app\locale\%LANG%\*.csv") do (
  if NOT EXIST "%BASE_PATH%\%LANG%\%%~nxI" del "%%~fI"
)

chcp %OLD_CP%
set OLD_CP=