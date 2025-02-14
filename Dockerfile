FROM node:20-bullseye-slim

USER root

# 必要なライブラリをインストール
RUN apt-get update && apt-get install -y \
  git \
  libvips-dev \
  sudo \ 
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm-run-all

RUN usermod -aG sudo node \
 && echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/node


RUN mkdir -p /workspace && chown -R node:node /workspace


# ワークディレクトリを `workspace` に戻す
USER node
WORKDIR /workspace
CMD ["bash"]
