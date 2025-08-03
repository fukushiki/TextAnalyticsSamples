# Git CZ セットアップガイド

## git clone後の初回セットアップ

1. 依存関係をインストール
```bash
npm install
```

2. コミット用のコマンドを実行
```bash
npm run commit
```

## 使用方法

通常の`git commit`の代わりに以下を使用：

```bash
npm run commit
```

または直接：

```bash
npx git-cz
```

## コミットメッセージ形式

設定により以下の形式でコミットメッセージが生成されます：

```
【🎸: feat】 新機能の説明
【🐛: fix】 バグ修正の説明
【💡: refactor】 リファクタの説明
```

## 利用可能なタイプ

- `feat`: 新機能追加 🎸
- `fix`: バグ修正 🐛
- `refactor`: コードリファクタ 💡
- `test`: テストコードの追加 💍
- `style`: コードの書式変更 💄
- `chore`: ドキュメント生成など 🤖
- `docs`: ドキュメント変更 ✏️
- `perf`: パフォーマンス改善 ⚡️
- `ci`: CI設定やスクリプト ⚙️
- `wip`: 作業中のコミット 🚧