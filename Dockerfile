FROM node:20-bullseye-slim

WORKDIR /workspace

# 必要なライブラリをインストール
RUN apt-get update && apt-get install -y \
    git \
    libvips-dev \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm-run-all

# `backend` と `frontend` をコピー
COPY backend backend
COPY frontend frontend

# `backend` (`Strapi`) の依存関係をインストール
WORKDIR /workspace/backend
RUN npm install

# `frontend` (`Next.js`) の依存関係をインストール
WORKDIR /workspace/frontend
RUN npm install

# ワークディレクトリを `workspace` に戻す
WORKDIR /workspace
CMD ["npm", "run", "start-all"]
