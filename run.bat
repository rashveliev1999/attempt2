@echo off
chcp 65001 >nul
cd /d "%~dp0"
python -m pip install customtkinter
python trimui_companion.py
pause
