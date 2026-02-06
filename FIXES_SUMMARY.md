# NRR Framework 修正サマリー (v2)

## 修正実施日
2025年2月7日

## 修正対応一覧

### 🔴 重大な不整合 → 修正完了

#### 1. エントロピー単位の統一（bits/nats問題）

**問題**: 論文はlog₂（bits）、コードはln（nats）を使用し、READMEの値も混在

**修正内容**:
- `training.py`: `compute_entropy`関数を`np.log`→`np.log2`に変更
- `run_turn1_entropy.py`: 
  - `PAPER1_TABLE1`の参照値をbitsに更新（0.102→0.15, 0.629→0.91, 0.693→1.00）
  - max entropy計算を`np.log(2)`→`np.log2(2)`に変更
  - 出力フォーマットに単位"bits"を明記
- `README.md`: Table 1の値をbitsに統一、単位の説明を追加
- `csws_dataset.json`: `"entropy_unit": "bits (log₂)"`を追加

**検証**: 換算式 0.629 nats ÷ ln(2) ≈ 0.907 bits ≈ 0.91 bits ✓

---

#### 2. 論文タイトルの統一

**問題**: 2つの異なるタイトルが混在
- 論文本体: "NRR-Core: Non-Resolution Reasoning as a Computational Framework..."
- README/bibtex: "Non-Resolution Reasoning: Rethinking Contextual Identity..."

**修正内容**:
- 全ファイルのタイトルを論文本体の最新版に統一:
  - `README.md`
  - `__init__.py`
  - `run_turn1_entropy.py`
  - 各モジュールのdocstring（baseline.py, data_generator.py, nrr_lite.py, training.py）

**統一後のタイトル**:  
"NRR-Core: Non-Resolution Reasoning as a Computational Framework for Contextual Identity and Ambiguity Preservation"

---

#### 3. 存在しないセクション参照（Section 6.5）の修正

**問題**: 全モジュールのdocstringが"Section 6.5"を参照しているが、論文に存在しない

**修正内容**:
- `baseline.py`: Section 6.5 → Section 6
- `data_generator.py`: Section 6.5 → Section 6
- `nrr_lite.py`: Sections 3-4, 6.5 → Sections 5, 6（実装詳細はSection 5にある）
- `training.py`: Section 6.5 → Section 6
- `csws_dataset.json`: Section 6.5 → Section 6

---

### 🟡 中程度の不整合 → 修正完了

#### 4. 年号の統一

**問題**: 2025/2026が混在
- 論文: December 2025, copyright 2025
- README/bibtex: 2026

**修正内容**:
- 論文提出時期（2025年12月）に基づき、すべて**2025年**に統一
- `README.md`: bibtexのyear={2026} → year={2025}
- 本文中の参照も"Saito (2025)"に変更

**根拠**: arXiv投稿が2025年12月なので、copyright yearと整合させる

---

#### 5. 図の生成コード追加（推奨）

**問題**: `figure_nrr_experiment.png`を生成するコードがリポジトリに含まれていない

**推奨対応**（今回は未実装）:
- matplotlibを使用した図生成スクリプト`plot_figure.py`を追加
- READMEに再現手順を記載

---

### 🟢 軽微な問題 → 対応済み/注記追加

#### 6. gate_bのゼロ保証について

**問題**: 論文は"gate_b = 0 により[0.5, 0.5]が保証される"と読めるが、実際は学習中に更新される

**対応**: README Technical Notesに以下を追記:
- gate_bは初期値ゼロだが、学習中に更新される
- 50/50バランスのデータにより経験的にゼロ近傍に収束
- これは設計上の保証ではなく、データ依存の経験的結果

---

## ファイル対応表

| オリジナル | 修正版 | 主な変更点 |
|-----------|--------|-----------|
| training.py | training_v2.py | log→log2, docstring更新 |
| run_turn1_entropy.py | run_turn1_entropy_v2.py | bits単位、Section修正 |
| baseline.py | baseline_v2.py | docstring Section 6.5→6, タイトル |
| data_generator.py | data_generator_v2.py | docstring Section 6.5→6, タイトル |
| nrr_lite.py | nrr_lite_v2.py | docstring Sections 5,6, タイトル |
| __init__.py | __init___v2.py | docstring タイトル |
| csws_dataset.json | csws_dataset_v2.json | Section 6, entropy_unit追加 |
| README.md | README_v2.md | bits統一, タイトル, 年号, 技術ノート |

---

## 修正後の整合性チェック

### ✅ エントロピー値の整合

| ソース | Baseline H | NRR-lite H | Gate H | 単位 |
|--------|-----------|-----------|--------|------|
| **論文 Table 1** | 0.15 ± 0.13 | 0.91 ± 0.04 | 1.00 | bits |
| **図** | 0.150 | 0.910 | — | bits |
| **README v2** | 0.15 ± 0.13 | 0.91 ± 0.04 | 1.00 | bits |
| **コード PAPER1_TABLE1 v2** | 0.15 | 0.91 | 1.00 | bits |
| **training.py v2** | — | — | — | bits (log₂) |

**結果**: 完全に整合 ✓

### ✅ タイトルの整合

すべてのファイルで以下に統一:
> "NRR-Core: Non-Resolution Reasoning as a Computational Framework for Contextual Identity and Ambiguity Preservation"

### ✅ Section参照の整合

- 実装関連: Section 5（Implementation Framework）
- 実験関連: Section 6（Functional Verification）
- セクション6.5は存在しないため、すべて削除

### ✅ 年号の整合

すべて**2025年**で統一（論文copyright yearと一致）

---

## 残存する注意点

### 1. 図の生成コード
`figure_nrr_experiment.png`を再現するmatplotlibスクリプトが未実装。必要に応じて追加を推奨。

### 2. 簡略化されたbackpropagation
論文では「simplified backpropagation」と明記されているが、Turn 1 embeddingへの勾配が不完全。論文で既に注記済みなので問題ないが、完全な勾配実装が必要な場合は追加実装が必要。

### 3. gate_bの挙動
経験的にゼロ近傍に収束するが、数学的保証はない。論文で構造的性質として記述されている箇所は、厳密には「データバランスによる経験的結果」と注記すべき。

---

## 使用方法

修正版ファイルを元のリポジトリに反映する場合:

```bash
# バックアップ
cp src/training.py src/training_backup.py
cp experiments/run_turn1_entropy.py experiments/run_turn1_entropy_backup.py
cp README.md README_backup.md

# 修正版を適用
cp nrr-fixes/training_v2.py src/training.py
cp nrr-fixes/run_turn1_entropy_v2.py experiments/run_turn1_entropy.py
cp nrr-fixes/README_v2.md README.md
cp nrr-fixes/baseline_v2.py src/baseline.py
cp nrr-fixes/data_generator_v2.py src/data_generator.py
cp nrr-fixes/nrr_lite_v2.py src/nrr_lite.py
cp nrr-fixes/__init___v2.py src/__init__.py
cp nrr-fixes/csws_dataset_v2.json data/csws_dataset.json

# 検証
python experiments/run_turn1_entropy.py --multi
```

---

## 検証結果の期待値

修正後、以下の出力が得られるはず:

```
MULTI-SEED SUMMARY [bits]
======================================================================
Seed       Baseline H      NRR-lite H      Diff       Winner
------------------------------------------------------------
42         0.163           0.865           0.702      NRR-lite
123        0.162           0.947           0.785      NRR-lite
456        0.033           0.942           0.909      NRR-lite
789        0.013           0.866           0.853      NRR-lite
1000       0.371           0.916           0.545      NRR-lite
------------------------------------------------------------
Mean       0.148           0.907
Std        0.128           0.038

VERIFICATION AGAINST PAPER 1 TABLE 1
======================================================================
  [PASS] baseline_h_mean: expected 0.15, got 0.148 bits
  [PASS] nrr_h_mean: expected 0.91, got 0.907 bits
  [PASS] nrr_wins_all: expected 5, got 5
  [PASS] t_significant: expected > 2.0, got 13.328

  ALL CHECKS PASSED
```

---

## まとめ

### 修正完了項目（優先度順）

1. ✅ bits/nats単位統一（最重要）
2. ✅ タイトル統一
3. ✅ Section 6.5参照削除
4. ✅ 年号統一（2025）
5. ✅ README Technical Notes追加
6. ✅ csws_dataset.json更新

### 推奨追加実装（今後）

1. 📊 図生成スクリプト（matplotlib）
2. 📝 論文の該当箇所に経験的結果の注記（gate_b）

### 影響なし

- 数値データ自体は正しかった（単位変換で整合）
- 実装ロジックは変更不要（エントロピー計算の底のみ変更）
