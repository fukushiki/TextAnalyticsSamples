# Marimo セットアップ・使い方ガイド

## Marimoとは

Marimoは、Pythonのリアクティブノートブック環境です。従来のJupyter Notebookと異なり、セル間の依存関係を自動で管理し、変更が自動的に反映されます。

## 起動方法

### コマンド実行

```bash
# npmスクリプト経由
npm run marimo

# 直接実行
uv run marimo edit

# 特定のファイルを開く
uv run marimo edit notebooks/example.py
```

## 基本的な使い方

### 1. 新しいノートブックの作成

```bash
uv run marimo edit new_notebook.py
```

### 2. 既存のノートブックを開く

```bash
uv run marimo edit existing_notebook.py
```

### 3. サーバーモードで実行

```bash
uv run marimo run notebook.py
```

## セルの操作

### セルの追加
- `Ctrl + M` または `Cmd + M`: 新しいセルを追加
- セル間の `+` ボタンをクリック

### セルの実行
- `Shift + Enter`: セルを実行して次のセルに移動
- `Ctrl + Enter`: セルを実行して同じセルにとどまる

### セルの削除
- セルを選択して `Delete` キー
- またはセルのメニューから削除

## リアクティブ機能

Marimoの最大の特徴は**リアクティブ性**です：

```python
# セル1: データの定義
import pandas as pd
data = pd.DataFrame({'x': [1, 2, 3], 'y': [4, 5, 6]})

# セル2: データの加工（セル1に依存）
processed_data = data * 2

# セル3: 可視化（セル2に依存）
import matplotlib.pyplot as plt
plt.plot(processed_data['x'], processed_data['y'])
```

**セル1を変更すると、セル2とセル3が自動的に再実行されます。**

## インタラクティブ要素

### スライダー
```python
import marimo as mo
slider = mo.ui.slider(1, 100, value=50)
slider
```

### ボタン
```python
import marimo as mo
button = mo.ui.button(label="クリック")
button
```

### テキスト入力
```python
import marimo as mo
text_input = mo.ui.text(placeholder="テキストを入力")
text_input
```

### チェックボックス
```python
import marimo as mo
checkbox = mo.ui.checkbox(label="チェック")
checkbox
```

## データ可視化の例

```python
# セル1: ライブラリのインポート
import pandas as pd
import matplotlib.pyplot as plt
import marimo as mo

# セル2: データの読み込み
df = pd.read_csv('data.csv')

# セル3: インタラクティブな列選択
column_selector = mo.ui.dropdown(
    options=df.columns.tolist(),
    value=df.columns[0],
    label="列を選択"
)
column_selector

# セル4: 選択された列のヒストグラム
plt.figure(figsize=(10, 6))
plt.hist(df[column_selector.value], bins=20)
plt.title(f'{column_selector.value}のヒストグラム')
plt.show()
```

## ファイル構成

推奨するノートブックの配置：

```
TextAnalyticsSamples/
├── notebooks/
│   ├── exploratory/          # 探索的分析
│   ├── preprocessing/        # データ前処理
│   ├── modeling/            # モデリング
│   └── visualization/       # 可視化
└── documents/
    └── Marimo.md           # このファイル
```

## 便利なTips

### 1. 自動保存
Marimoは変更を自動保存します。

### 2. エクスポート
```bash
# HTMLにエクスポート
uv run marimo export html notebook.py -o output.html

# Jupyter Notebookにエクスポート
uv run marimo export ipynb notebook.py -o output.ipynb
```

### 3. デバッグモード
```python
import marimo as mo
mo.config.debug = True
```

### 4. 非同期処理
```python
import asyncio
import marimo as mo

async def fetch_data():
    # 非同期処理
    await asyncio.sleep(1)
    return "データ"

# UIで非同期処理を実行
async_button = mo.ui.run_button(fetch_data)
```

## よく使うライブラリとの組み合わせ

### Pandas + Matplotlib
```python
import pandas as pd
import matplotlib.pyplot as plt
import japanize_matplotlib  # 日本語対応

# データの可視化
df.plot(kind='bar')
plt.title('データの可視化')
plt.show()
```

### NetworkX + PyVis
```python
import networkx as nx
from pyvis.network import Network

# ネットワーク図の作成
G = nx.karate_club_graph()
net = Network()
net.from_nx(G)
net.show('network.html')
```

### spaCy + WordCloud
```python
import spacy
from wordcloud import WordCloud

# テキスト分析と可視化
nlp = spacy.load('ja_core_news_sm')
doc = nlp(text)
tokens = [token.text for token in doc if not token.is_stop]
wordcloud = WordCloud(font_path='NotoSansCJK-Regular.ttc').generate(' '.join(tokens))
```

## トラブルシューティング

### ポートが使用中の場合
```bash
# 別のポートで起動
uv run marimo edit --port 8081
```

### 依存関係の問題
```bash
# 環境の再構築
uv sync --reinstall
```

### ブラウザが自動で開かない場合
手動で `http://localhost:2718` にアクセス