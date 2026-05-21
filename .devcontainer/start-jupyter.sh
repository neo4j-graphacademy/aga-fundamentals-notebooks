#!/usr/bin/env bash
# Start a long-running Jupyter server on port 8888.
#
# Auth model: the port is forwarded as `private` in devcontainer.json, so only
# the codespace owner (or someone with an authenticated tunnel) can reach it.
# The Jupyter server itself runs without a token/password so that the
# GraphAcademy kernel bridge can talk to it via the forwarded port without an
# additional credential negotiation.
#
# CORS is permissive (allow_origin=*) because the bridge connects from a
# different origin (graphacademy.neo4j.com or localhost:3001 in dev).
set -euo pipefail

# Idempotent — if Jupyter is already running, do nothing.
if pgrep -f "jupyter-server" > /dev/null; then
    echo "[jupyter] already running"
    exit 0
fi

# Make sure jupyter is installed (covers the case where setup.sh hasn't run yet).
if ! command -v jupyter > /dev/null; then
    pip install --quiet jupyter jupyter-server
fi

LOG=/tmp/jupyter.log
nohup jupyter server \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --ServerApp.token='' \
    --ServerApp.password='' \
    --ServerApp.disable_check_xsrf=True \
    --ServerApp.allow_origin='*' \
    --ServerApp.allow_remote_access=True \
    --ServerApp.root_dir="${PWD}" \
    > "${LOG}" 2>&1 &

echo "[jupyter] starting on port 8888 (logs: ${LOG})"
