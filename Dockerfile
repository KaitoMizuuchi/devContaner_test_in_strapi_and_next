FROM node:20-bullseye-slim

WORKDIR /workspace

# 必要なライブラリをインストール
RUN apt-get update && apt-get install -y \
  git \
  libvips-dev \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm-run-all

RUN mkdir -p /workspace && chown -R node:node /workspace

USER node

# `backend` と `frontend` をコピー
COPY --chown=node:node backend backend
COPY --chown=node:node frontend frontend

# `backend` (`Strapi`) の依存関係をインストール
WORKDIR /workspace/backend
RUN mkdir -p node_modules && chown -R node:node node_modules && npm install

# `frontend` (`Next.js`) の依存関係をインストール
WORKDIR /workspace/frontend
RUN mkdir -p node_modules && chown -R node:node node_modules && npm install

# ワークディレクトリを `workspace` に戻す
WORKDIR /workspace
CMD ["npm", "run", "start-all"]
