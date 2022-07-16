#stage 1
FROM node:16.14.0 as node

WORKDIR /app
COPY package*.json ./
RUN npm i
COPY . .

RUN npm run build --prod

#stage2
FROM nginx:alpine
COPY --from=node /app/dist/angular-cicd /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]




