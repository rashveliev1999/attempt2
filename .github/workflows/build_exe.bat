@echo off
chcp 65001 >nul
cd /d "%~dp0"
where python >nul 2>nul
if errorlevel 1 (
  echo Python 3.10+ not found. Install it from https://www.python.org/downloads/windows/
  pause
  exit /b 1
)
python -m pip install --upgrade pip customtkinter pyinstaller
if errorlevel 1 goto fail
python -m PyInstaller --noconfirm --clean --onefile --windowed --name TrimUICompanion --collect-all customtkinter trimui_companion.py
if errorlevel 1 goto fail
echo.
echo Build complete: dist\TrimUICompanion.exe
pause
exit /b 0
:fail
echo.
echo Build failed. Check the error above.
pause
exit /b 1
