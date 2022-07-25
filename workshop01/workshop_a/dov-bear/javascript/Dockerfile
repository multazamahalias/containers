FROM node:18

ARG APP_DIR=/app

WORKDIR ${APP_DIR}

ADD main.js .
ADD package.json .
ADD package-lock.json .
ADD public public
ADD views views

RUN npm ci

ENV PORT=5000
EXPOSE ${PORT}
ENV INSTANCE_NAME=dov-bear
ENV INSTANCE_HASH=hash-dov-bear

ENTRYPOINT [ "node", "main.js" ]