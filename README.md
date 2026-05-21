# Aura Graph Analytics Fundamentals — Notebooks

Companion notebooks for the **Aura Graph Analytics Fundamentals** course on Neo4j GraphAcademy. Module 3 of the course runs entirely in these notebooks.

## Quick start (GitHub Codespaces)

1. Click **Code → Create codespace on main** (or use the launch button from the GraphAcademy lesson).
2. Wait ~2 minutes for the Codespace to install dependencies.
3. Copy `env.template` to `.env`:
   ```bash
   cp env.template .env
   ```
4. Edit `.env` and fill in your Aura credentials (see table below).
5. Open `notebooks/1_connect.ipynb` and run the cells in order.

## What goes in `.env`

| Variable | Where to get it |
| --- | --- |
| `AURA_CLIENT_ID` | Aura Console → Account → API credentials |
| `AURA_CLIENT_SECRET` | Aura Console → Account → API credentials |
| `AURA_URI` | Aura Console → your AuraDB instance |
| `AURA_USERNAME` | Aura Console → your AuraDB instance |
| `AURA_PASSWORD` | Aura Console → your AuraDB instance |

`.env` is gitignored. Never commit credentials.

## Notebooks

Work through these in order. Each one is paired with a GraphAcademy lesson.

| Notebook | Lesson |
| --- | --- |
| `notebooks/1_connect.ipynb` | Connect via the client |
| `notebooks/2_syntax.ipynb` | The attached AGA workflow end to end |
| `notebooks/3_standalone.ipynb` | Standalone sessions from DataFrames |

## Running locally (without Codespaces)

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp env.template .env
# edit .env, then:
jupyter lab notebooks/
```

You'll need Python 3.11+.

## Course

Full course: [Aura Graph Analytics Fundamentals](https://graphacademy.neo4j.com/courses/aga-fundamentals/) on Neo4j GraphAcademy.
