# Stage 1
FROM node:14.15.4 as node
WORKDIR /src
COPY . .
RUN npm install
RUN npm run build 
# Stage 2
FROM nginx:alpine
COPY --from=node /src/dist/hello /usr/share/nginx/html