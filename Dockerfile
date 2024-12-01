FROM node:alpine as builder
WORKDIR /data1/source
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /data1/source/build /usr/share/nginx/html