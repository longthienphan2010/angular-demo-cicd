#stage 1
FROM node:16.14.0 as node

COPY package*.json ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
RUN npm i
WORKDIR /app
COPY . .

RUN npm run build --prod

#stage2
FROM nginx:alpine
COPY --from=node /app/dist/angular-cicd /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]




