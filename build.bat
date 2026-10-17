@echo off
REM GameBoost build script. Requires Python 3.9+ on PATH.
REM Output: dist\GameBoost.exe
setlocal
cd /d %~dp0

if not exist .buildenv (
    python -m venv .buildenv
    if errorlevel 1 goto :fail
)

.buildenv\Scripts\python.exe -m pip install -q pyinstaller
REM China mainland users: replace the line above with a mirror, e.g.
REM .buildenv\Scripts\python.exe -m pip install -q -i https://pypi.tuna.tsinghua.edu.cn/simple pyinstaller
if errorlevel 1 goto :fail

.buildenv\Scripts\python.exe -m PyInstaller --onefile --noconsole --name GameBoost --clean main.py
if errorlevel 1 goto :fail

echo.
echo Done: dist\GameBoost.exe
pause
exit /b 0

:fail
echo.
echo Build failed.
pause
exit /b 1
