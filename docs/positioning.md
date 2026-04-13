# NRR-Core Positioning

This note gives a short public-facing view of where the NRR-Core line sits among nearby approaches. The focus is ambiguity-preserving inference at the foundation level: keeping multiple plausible interpretations available before disambiguating context arrives, then allowing commitment when later evidence supports it.

NRR-Core is not a replacement for standard LLM use. In this line, the contribution is the foundational criterion itself: make early collapse measurable, compare it against an ambiguity-preserving variant, and report the conditions under which preservation and later commitment can coexist.

## How It Relates to Nearby Approaches

| Approach | Typical focus | How NRR-Core differs |
| --- | --- | --- |
| Fuzzy reasoning | Represents graded truth or soft category boundaries. | NRR-Core focuses on preserving multiple discrete interpretations before context resolves them. |
| Calibrated abstention | Decides whether to answer or abstain under low confidence. | NRR-Core focuses on internal ambiguity preservation before the final response decision. |
| Word sense disambiguation | Chooses one sense from local context. | NRR-Core focuses on whether collapse can be delayed until later context arrives. |

## What This Repository Covers

- Foundational ambiguity-preserving inference and Turn 1 entropy evaluation.
- Paired comparison between a matched baseline and an ambiguity-preserving variant.
- Manuscript, reproducibility, and verification materials for the Core line.

Formal definitions, experiments, and limitations remain in the manuscript and reproducibility materials.

## Navigation

- [README](../README.md)
- [Reproducibility](../reproducibility.md)
- [Search Keywords and Reader Guide](./keywords.md)
- [arXiv: 2512.13478](https://arxiv.org/abs/2512.13478)
