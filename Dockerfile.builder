FROM node:10-alpine as build

WORKDIR /app

ONBUILD COPY package.json package-lock.json /app/

ONBUILD RUN if [ -e /app/package-lock.json ]; \
  then \
    echo 'Running npm ci...' && npm ci; \
  else \
    echo 'Running npm install' && npm install; \
fi

COPY default_liara_nginx.conf /app/liara_nginx.conf

ONBUILD COPY . /app

ONBUILD RUN npm run build -- --prod --output-path=dist