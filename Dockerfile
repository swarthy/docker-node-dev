ARG IMAGE_VERSION

FROM node:${IMAGE_VERSION}

RUN yarn global add @swarthy/wait-for@2.0.3 && \
    yarn cache clean

COPY aliases.sh /etc/profile.d/aliases.sh

WORKDIR /app

RUN mkdir -p /yarn-cache && \
    chown -R node:node /yarn-cache

USER node

ENV YARN_CACHE_FOLDER="/yarn-cache"

CMD ["yarn", "run", "dev"]
