# Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:latest as node
WORKDIR /src
COPY . .
RUN npm install
RUN npm run build 
# Stage 2
FROM nginx:alpine
COPY --from=node /src/dist/hello /usr/share/nginx/html