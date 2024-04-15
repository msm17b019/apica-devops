FROM node:lts-alpine as build
WORKDIR /app
COPY ./todo-list/package.json ./todo-list/package-lock.json ./
RUN npm install
COPY ./todo-list ./
RUN npm run build

FROM node:lts-alpine
WORKDIR /app
COPY --from=build /app/build ./build
RUN npm install -g serve
EXPOSE 80
CMD ["serve", "-s", "build", "-l", "80"]
