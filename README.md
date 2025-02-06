このリポジトリはStrapiとNext.jsをベースとした開発環境を構築するためのプロジェクトです。
# 前提
* WSL2のインストール（Ubuntuの24.04の使用を推奨）
* VSCodeのインストール。拡張機能「Dev Containers」のインストール

# リポジトリのクローン
Ubuntu内のルートディレクトリで作業
```bash
cd ~
```
クローン(sshキーの設定がまだの方はsshキーの設定を行ってください)
```bash
git clone git@github.com:KaitoMizuuchi/devContaner_test_in_strapi_and_next.git
```
ディレクトリの移動
```bash
cd devContaner_test_in_strapi_and_next
```

# Dev Containerの起動
.envファイルの作成
```bash
cp .env.example .env
```
VSCodeを開く
```bash
code .
```
VSCoden内で`Ctrl + Shift + P`を押して、`Dev Containers: Reopen in Container`を選択

# コンテナの起動
上手くいかない場合は、`devContaner_test_in_strapi_and_next`このディレクトリで以下を行う
```bash
# 初回ビルド（必要に応じて）
docker-compose build

# コンテナを起動
docker-compose up -d
```


# 各種URL
* http://localhost:3000 - Next.js
* http://localhost:1337 - Strapi
* http://localhost:8080 - PgAdmin
* http://localhost:9000 - minio




