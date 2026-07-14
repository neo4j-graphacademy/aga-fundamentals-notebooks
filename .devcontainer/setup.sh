#!/usr/bin/env bash
# Install Python dependencies for the notebook environment.
#
# Idempotent: cheap import-check first so this can be wired into both
# postCreateCommand and postStartCommand — if everything's already
# installed, this is a no-op that finishes in a few hundred ms.
#
# Uses `python3 -m pip` explicitly to avoid PATH ambiguity and prints
# versions so any failure is visible in the Codespaces creation log.
set -eo pipefail

echo "==> Environment:"
python3 --version
python3 -m pip --version

# Cheap check — if the two key packages import, we're done.
if python3 -c "import graphdatascience, jupyterlab" > /dev/null 2>&1; then
    echo "==> Dependencies already installed, skipping."
    exit 0
fi

echo "==> Upgrading pip..."
python3 -m pip install --upgrade pip

echo "==> Installing Jupyter first so the UI comes up even if a downstream package fails..."
python3 -m pip install jupyterlab ipykernel ipywidgets

echo "==> Installing course requirements..."
python3 -m pip install -r requirements.txt

echo "==> Setup complete."
