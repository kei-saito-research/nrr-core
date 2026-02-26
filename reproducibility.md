# Reproducibility

## Environment
- Python: 3.13.7 (`python3`)
- Main libraries: NumPy >= 1.20.0, Matplotlib >= 3.5.0
- OS: Darwin 25.2.0 arm64

## Fixed settings
- model: Baseline (single embedding) vs NRR-lite (multi-vector + context gate), `embed_dim=32`, `hidden_dim=64`
- seed: `[42, 123, 456, 789, 1000]` (paper-aligned multi-seed setting)
- temperature: N/A (no LLM sampling in this repo)
- trials: 5 seeds (multi-seed aggregate)

## Run commands
```bash
pip install -r requirements.txt
python3 experiments/run_turn1_entropy.py --multi
```

## Artifact map
| Table/Figure | Command | Output file |
|---|---|---|
| Paper Table 1 (Turn 1 entropy verification) | `python3 experiments/run_turn1_entropy.py --multi` | `results/turn1_entropy_output.json` |
| Public manuscript source (current snapshot) | N/A (tracked artifact) | `manuscript/current/paper1_nrr-core_v24.tex` |
| Public manuscript figure (current snapshot) | N/A (tracked artifact) | `manuscript/current/figure_nrr_experiment.png` |
| Archived local manuscript snapshot | N/A (tracked artifact) | `manuscript/archive/local-v36/paper1_nrr-core_v36.tex` |
| Version map | N/A (tracked artifact) | `VERSION_MAP.md` |

## Known limitations
- Exact floating-point values can vary slightly by Python/NumPy build.
- No container lockfile is provided; environment is documented but not fully pinned.
