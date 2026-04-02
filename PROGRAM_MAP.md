# NRR Program Map

This page is the repository-local map for numbered paper identities and the
current cross-series spine.
For narrow review surfaces, use this page together with each manuscript's local
README / reproducibility notes rather than treating it as a full public-status board.

## Current Series Spine

- `Core -> Phi -> IME / Transfer / Coupled -> Projection -> integrated paper7 -> Energy -> Guarantee`
- `Projection` is the structural bridge / companion line after the interface and
  propagation papers and before integrated `paper7`.
- `Energy` is the operational-control / conditional-utility calibration layer.
- `Guarantee` is the bounded verification / assurance closure layer.
- The numbered-paper map below covers the canonical numbered papers (`paper1`,
  `paper2`, `paper4`, `paper5`, `paper6`, `paper7`) while the current spine also
  includes non-numbered downstream companion / closure lines.

## Series Numbering Policy
- Numbered active set: 1, 2, 4, 5, 6, 7
- `paper3` is permanently skipped and never reused.
- Mapping:
  - `paper1`: Core
  - `paper2`: Phi
  - `paper4`: IME
  - `paper5`: Transfer
  - `paper6`: Coupled
  - `paper7`: integrated paper7

## Read Order
1. **paper1 / NRR-Core** (foundation)
2. **paper2 / NRR-Phi** (text-to-state mapping + operator principles)
3. **paper3** (intentionally skipped)
4. **paper4 / NRR-IME** (implementation on stateless APIs; under moderation)
5. **paper5 / NRR-Transfer** (cross-domain transfer; pre-submission line)
6. **paper6 / NRR-Coupled** (dependency-consistency for coupled updates; pre-submission line)
7. **NRR-Projection** (structural bridge / companion line)
8. **paper7 / integrated NRR-Principles+Boundary line** (comparison-and-boundary-honesty layer; pre-submission line)
9. **NRR-Energy** (operational-control / conditional-utility calibration line)
10. **NRR-Guarantee** (bounded verification / assurance closure line)

`NRR-Hout` is deferred to a later phase (outside the current active set).

## Paper / Code Links

### paper1) NRR-Core
- Paper: [arXiv:2512.13478](https://arxiv.org/abs/2512.13478)
- Code: [github.com/kei-saito-research/nrr-core](https://github.com/kei-saito-research/nrr-core)

### paper2) NRR-Phi
- Paper: [arXiv:2601.19933](https://arxiv.org/abs/2601.19933)
- Code: [github.com/kei-saito-research/nrr-phi](https://github.com/kei-saito-research/nrr-phi)

### paper3) (permanently skipped)
- No paper is assigned to `paper3`.

### paper4) NRR-IME
- Paper: repository public; manuscript moderation result pending
- Code: [github.com/kei-saito-research/nrr-ime](https://github.com/kei-saito-research/nrr-ime)

### paper5) NRR-Transfer
- Paper: arXiv submission pending
- Code: [github.com/kei-saito-research/nrr-transfer](https://github.com/kei-saito-research/nrr-transfer)

### paper6) NRR-Coupled
- Paper: arXiv submission pending
- Code: [github.com/kei-saito-research/nrr-coupled](https://github.com/kei-saito-research/nrr-coupled)

### paper7) integrated NRR-Principles+Boundary line
- Paper: in preparation
- Code: [github.com/kei-saito-research/nrr-principles](https://github.com/kei-saito-research/nrr-principles)

### NRR-Projection
- Paper: local theory-line manuscript
- Code: local workspace line (`nrr-projection`)

### NRR-Energy
- Paper: local downstream calibration manuscript
- Code: local workspace line (`nrr-energy`)

### NRR-Guarantee
- Paper: local downstream assurance manuscript
- Code: local workspace line (`nrr-guarantee`)

### NRR-Hout (deferred)
- Paper: planned for a later phase
- Code: TBD

## One-Line Scope per Paper
- **Core**: Introduces NRR and non-resolution as a computational principle.
- **Phi**: Defines text-to-state mapping and non-collapsing operator conditions.
- **IME**: Finds the stable implementation pattern (Phase 1.5) for stateless APIs.
- **Transfer**: Tests whether the same Phase 1.5 interface transfers across domains.
- **Coupled**: Tests dependency-consistency behavior under coupled client-side updates.
- **Projection**: Provides the theory-first structural bridge from the retained-state layer to the later comparison-and-boundary surfaces.
- **integrated paper7**: Carries the delayed-commitment pattern comparison together with explicit boundary-honesty reporting.
- **Energy**: Carries the operational-control / conditional-utility calibration layer.
- **Guarantee**: Carries the bounded verification / assurance closure layer.
- **HOUT**: Measures ambiguity preserved on the output side (`H_out`) as a diagnostic layer.

## Repro Entry Points
- Core: `experiments/run_turn1_entropy.py`
- Phi: see repository `README` and `experiments/`
- IME / Transfer / Coupled / Projection / integrated paper7 / Energy / Guarantee: see each repository `README` and reproducibility guide.

## Contact
Questions, implementation discussions, and collaboration ideas are welcome via GitHub Issues / Discussions on the repositories above.
