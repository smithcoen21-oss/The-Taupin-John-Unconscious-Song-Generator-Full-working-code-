@echo off
title Creative Grammar Song Generator
where python >nul 2>nul
if errorlevel 1 (echo Python was not found. Install Python 3.11 or newer.&pause&exit /b 1)
where ollama >nul 2>nul
if errorlevel 1 (echo Ollama was not found. Install Ollama first.&pause&exit /b 1)
if not exist ".venv" (python -m venv .venv)
call .venv\Scripts\activate.bat
pip install -r requirements.txt
curl -s http://localhost:11434/api/tags >nul 2>nul
if errorlevel 1 (start "" ollama serve & timeout /t 3 /nobreak >nul)
echo Open http://localhost:8000
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
pause
