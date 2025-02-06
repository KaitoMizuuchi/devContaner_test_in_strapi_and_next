FROM node:20-bullseye-slim

WORKDIR /workspace
# libvips-dev など必要なら apt-get で
RUN apt-get update && apt-get install -y \
    git \
    libvips-dev \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm-run-all

CMD ["npm", "run", "start-all"]

