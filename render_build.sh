#!/usr/bin/env bash
# Exit on error
set -o errexit

echo "--- Installing dependencies ---"
pip install --upgrade pip
pip install -r backend/requirements.txt

echo "--- Training ML Model ---"
# We need to be in the backend directory for relative imports to work during training
cd backend
python -m ml.train_model
cd ..

echo "--- Build complete ---"
