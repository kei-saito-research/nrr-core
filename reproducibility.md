# Reproducibility (NRR-Core)

## Scope

This repository snapshot bundles the current manuscript source package together with
the primary offline verification entrypoint used for the public Core line.
This reproducibility note describes the current package snapshot.
`VERSION_MAP.md` remains the full-repo version map and may list non-bundled
historical rows.

## Primary package commands

- Build the current manuscript to temp output:
  - `bash scripts/build_current_manuscript.sh`
  - output: `/tmp/nrr-core_current_build/paper1_nrr-core_v45.pdf`
- Verify that `manuscript/current/` contains only the latest `.tex` / `.pdf` pair:
  - `bash scripts/verify_active_review_surface.sh`
- Verify the current package checksum manifest:
  - `bash scripts/verify_current_package.sh`
- Reproduce the primary result to temp output:
  - `bash scripts/run_primary_check.sh`
  - output: `/tmp/nrr_core_turn1_entropy_output.json`

## Current package snapshot

- Main TeX: `manuscript/current/paper1_nrr-core_v45.tex`
- Main PDF: `manuscript/current/paper1_nrr-core_v45.pdf`
- Current manuscript figure: `manuscript/figures/figure_nrr_experiment.png`
- Current manuscript checksum manifest: `manuscript/checksums_active_review_surface_sha256.txt`
- Current package checksum manifest: `manuscript/checksums_current_package_sha256.txt`
- Public arXiv note: the current public repo snapshot remains
  `manuscript/archive/public-v39/paper1_nrr-core_v39.tex`; the `v40`, `v41`,
  `v42`, and `v43` packages named here are prior derived lines, and the `v44`
  package named here is the current manuscript snapshot. That version note does
  not require bundling the full `v39` source tree.

## Checksum policy

- `manuscript/checksums_active_review_surface_sha256.txt` covers the latest
  `.tex` / `.pdf` pair in `manuscript/current/`.
- `manuscript/checksums_current_package_sha256.txt` covers the current
  package entrypoints, the latest manuscript pair, and the figure asset consumed
  by that manuscript from `manuscript/figures/`.
- Coverage excludes older manuscript versions kept under `manuscript/archive/`
  and generated outputs outside the tracked current package.

## Environment

- Python: 3.13.7 (`python3`)
- Main libraries: NumPy >= 1.20.0, Matplotlib >= 3.5.0
- OS: Darwin 25.2.0 arm64

## Fixed protocol settings

- Model comparison: Baseline (single embedding) vs NRR-lite (multi-vector + context gate)
- Model settings: `embed_dim=32`, `hidden_dim=64`
- Seed set: `[42, 123, 456, 789, 1000]`
- Temperature: N/A (no LLM sampling in this repo)
- Trials: 5 seeds (multi-seed aggregate)

## Artifact map

| Artifact | Command | Output |
|---|---|---|
| Paper Table 1 entropy verification | `bash scripts/run_primary_check.sh` | `/tmp/nrr_core_turn1_entropy_output.json` |
| Current manuscript build | `bash scripts/build_current_manuscript.sh` | `/tmp/nrr-core_current_build/paper1_nrr-core_v45.pdf` |
| Current manuscript verification | `bash scripts/verify_active_review_surface.sh` | stdout verification for `manuscript/checksums_active_review_surface_sha256.txt` |
| Current package checksum verification | `bash scripts/verify_current_package.sh` | stdout verification for `manuscript/checksums_current_package_sha256.txt` |
| Current manuscript source snapshot | N/A (tracked artifact) | `manuscript/current/paper1_nrr-core_v45.tex` |
| Current manuscript PDF snapshot | N/A (tracked artifact) | `manuscript/current/paper1_nrr-core_v45.pdf` |
| Current manuscript figure snapshot | N/A (tracked artifact) | `manuscript/figures/figure_nrr_experiment.png` |
| Full-repo version map | N/A (tracked artifact) | `VERSION_MAP.md` |

## Known limitations

- Exact floating-point values can vary slightly by Python/NumPy build.
- No container lockfile is provided; environment is documented but not fully pinned.
