# Creative Grammar Song Generator

A local-first AI songwriting laboratory based on the "Unconscious Creative Grammar" hypothesis.

The application does not attempt to imitate a particular songwriter. Instead it transforms human material through situation, character, desire, obstacle, emotional distance, specific details, what remains unsaid, original lyric, and musical interpretation.

## Requirements

- Python 3.11+
- Ollama
- A local Ollama model
- Recommended starter model: `qwen3:8b`

## Ubuntu

Install Ollama, then:

```bash
ollama pull qwen3:8b
chmod +x start-linux.sh
./start-linux.sh
```

Open `http://localhost:8000`.

## Windows

Install Python 3.11+ and Ollama, then run:

```bat
ollama pull qwen3:8b
start-windows.bat
```

Open `http://localhost:8000`.

## Manual start

```bash
python -m venv .venv
# Linux/macOS: source .venv/bin/activate
# Windows: .venv\Scripts\activate
pip install -r requirements.txt
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```

Set `OLLAMA_URL` and `OLLAMA_MODEL` in `.env` if needed. `.env.example` is provided.

## Docker

If Ollama is running on the host:

```bash
docker compose up --build
```

Then open `http://localhost:8000`.

## API

- `GET /health`
- `GET /api/models`
- `POST /api/generate`

Example request:

```json
{
  "experience": "I returned to my childhood town after twenty years...",
  "person": "my father",
  "place": "the old railway station",
  "object_detail": "a blue enamel cup",
  "unsaid": "I never told him I was afraid to leave",
  "emotional_temperature": "bittersweet",
  "perspective": "first person",
  "genre": "piano ballad",
  "tempo": "slow"
}
```

## Privacy

The application is designed for local use. Your experience is sent to the local Ollama server configured by `OLLAMA_URL`. No external AI API is required.

## Philosophy

The system treats AI as a creative mirror rather than the source of human emotional experience. The human provides the source material; the AI helps identify situation, character, desire, conflict, emotional distance, specific details, omissions, imagery, and narrative possibilities before creating an original song.
