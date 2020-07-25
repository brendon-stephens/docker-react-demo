FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx as server
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# default command of nginx image already starts it