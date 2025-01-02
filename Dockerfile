FROM node:22.12-bullseye as base

RUN --mount=type=cache,target=/var/cache/apt apt-get update && apt-get install git net-tools procps -y
RUN corepack enable pnpm

COPY --chown=node . /home/node
WORKDIR /home/node
USER node
RUN pnpm install
RUN pnpm run build

EXPOSE 8788
CMD ["pnpm", "run", "start"]
