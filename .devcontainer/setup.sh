#!/usr/bin/env bash
set -euo pipefail

echo "Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo ""
echo "Dependencies installed."
