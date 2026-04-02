#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT_JSON="${1:-/tmp/nrr_core_turn1_entropy_output.json}"

cd "$ROOT"
python3 experiments/run_turn1_entropy.py --multi --output "$OUT_JSON"
