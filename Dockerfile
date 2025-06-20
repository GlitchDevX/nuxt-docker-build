# Stage 1: Generate Static Files
FROM node:lts-alpine AS builder

RUN npm i -g pnpm

COPY . .

RUN pnpm i

RUN pnpm run generate -- result


# Stage 2: Build Final Image
FROM nginx:stable-alpine

COPY --from=builder result/.output/public /usr/share/nginx/html

EXPOSE 80

