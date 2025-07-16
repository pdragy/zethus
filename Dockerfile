FROM node:8 AS build
WORKDIR /src
COPY . ./
RUN npm ci && npm run build

FROM nginx
COPY --from=build /src/build /usr/share/nginx/html
