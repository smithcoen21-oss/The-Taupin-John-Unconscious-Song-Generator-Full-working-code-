#!/usr/bin/env bash
set -e
if ! command -v python3 >/dev/null 2>&1; then echo "Python 3 is required."; exit 1; fi
if ! command -v ollama >/dev/null 2>&1; then echo "Ollama was not found. Install it and run: ollama pull qwen3:8b"; exit 1; fi
if [ ! -d ".venv" ]; then python3 -m venv .venv; fi
source .venv/bin/activate
pip install -r requirements.txt
if ! curl -s http://localhost:11434/api/tags >/dev/null; then ollama serve >/tmp/song-generator-ollama.log 2>&1 & sleep 3; fi
echo "Open http://localhost:8000"
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
