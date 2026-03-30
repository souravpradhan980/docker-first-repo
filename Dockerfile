FROM node:24-alpine AS nodework
WORKDIR /react-first-app
COPY package*.json ./
RUN npm install
COPY . .

#CMD ["npm","run","dev"]
RUN npm run build

# //nginx 
 FROM nginx:1.23-alpine
 WORKDIR /usr/share/nginx/html
 RUN rm -rf ./*
 COPY --from=nodework /react-first-app/dist .
 EXPOSE 8091
 ENTRYPOINT ["nginx", "-g", "daemon off;"]