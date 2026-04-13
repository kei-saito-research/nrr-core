# Scripts

This directory contains the stable manuscript and verification wrappers for the
current NRR-Core repository surface.

## Stable entrypoints

- `build_current_manuscript.sh`
  - builds the latest manuscript in `manuscript/current/` to a temp output directory
- `run_primary_check.sh`
  - reruns the primary Turn 1 entropy verification to a temp JSON output
- `verify_active_review_surface.sh`
  - verifies that `manuscript/current/` contains only the current `.tex` / `.pdf` pair and checks `manuscript/checksums_active_review_surface_sha256.txt`
- `verify_current_package.sh`
  - verifies the current manuscript files first and then checks `manuscript/checksums_current_package_sha256.txt`

The stable public interface for the current package is the four entrypoints
above.
