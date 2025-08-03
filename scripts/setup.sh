#!/bin/bash

# uvのインストール（まだインストールされていない場合）
if ! command -v uv &> /dev/null; then
    echo "uvをインストール中..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# プロジェクトのセットアップ
echo "uvプロジェクトをセットアップ中..."
uv sync --dev

echo "セットアップ完了!"
echo "仮想環境をアクティベート: source .venv/bin/activate"
echo "または: uv run python your_script.py"