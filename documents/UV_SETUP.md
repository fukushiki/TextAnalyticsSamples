# UV環境セットアップガイド

## ローカル環境でのセットアップ

### 1. uvのインストール
```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### 2. プロジェクトセットアップ
```bash
# 自動セットアップスクリプトを実行
./scripts/setup.sh

# または手動で
uv sync --dev
```

### 3. 仮想環境の使用
```bash
# 仮想環境をアクティベート
source .venv/bin/activate

# または直接実行
uv run python your_script.py
uv run pytest
```

## GitHub Codespacesでのセットアップ

1. **自動セットアップ**: Codespace作成時に自動でuvがインストールされ、依存関係がセットアップされます

2. **手動確認**:
```bash
# uvの確認
uv --version

# 依存関係の再インストール（必要な場合）
uv sync --dev
```

## 便利なコマンド

```bash
# 依存関係の追加
uv add numpy pandas

# 開発依存関係の追加
uv add --dev pytest black

# 依存関係の削除
uv remove package-name

# 仮想環境のクリーン再作成
uv sync --reinstall

# Pythonバージョンの指定
uv python install 3.11
uv python pin 3.11
```

## VS Code設定

`.devcontainer/devcontainer.json`により以下が自動設定されます：
- Python拡張機能
- Black (フォーマッター)
- isort (import整理)
- Flake8 (リンター)
- mypy (型チェッカー)

## トラブルシューティング

### uvが見つからない場合
```bash
export PATH="$HOME/.cargo/bin:$PATH"
```

### 仮想環境が見つからない場合
```bash
uv sync
```