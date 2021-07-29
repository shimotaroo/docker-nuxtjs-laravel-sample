FROM node:14.17-alpine

RUN apk update && \
    apk add git && \
    apk add --no-cache curl && \
    curl -o- -L https://yarnpkg.com/install.sh | sh && \
    yarn add @vue/cli @vue/cli-service-global nuxt create-nuxt-app

ENV TZ Asia/Tokyo
ENV PATH $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
# ENTRYPOINT ["docker-entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /app

CMD ["/bin/ash"]
