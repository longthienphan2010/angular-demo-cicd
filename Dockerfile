#stage 1
FROM node:16.14.0 as node

COPY package*.json ./
RUN npm i && mkdir /app && cp -R ./node_modules ./app

WORKDIR /app



COPY . .

RUN npm run build --prod

#stage2
FROM nginx:alpine
COPY --from=node /app/dist/angular-cicd /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]




