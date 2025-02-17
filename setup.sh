#!/bin/sh

# ルートディレクトリの.env作成
if [ -f .env.example ] && [! -f .env ]; then
  cp .env.example .env
  echo ".envファイルを作成しました。"
fi

# backend/.env作成
if [ -f backend/.env.example ] && [! -f backend/.env ]; then
  cp backend/.env.example backend/.env
  echo "backend/.envを作成しました。"

  # backend/.envにランダムな値を追記
  echo "APP_KEYS=\"$(openssl rand -hex 16),$(openssl rand -hex 16)\"" >> backend/.env
  echo "API_TOKEN_SALT=\"$(openssl rand -hex 16)\"" >> backend/.env
  echo "ADMIN_JWT_SECRET=\"$(openssl rand -hex 32)\"" >> backend/.env
  echo "TRANSFER_TOKEN_SALT=\"$(openssl rand -hex 16)\"" >> backend/.env
  echo "JWT_SECRET=\"$(openssl rand -hex 32)\"" >> backend/.env

  echo "backend/.envにランダムな値を追記しました。"
fi

