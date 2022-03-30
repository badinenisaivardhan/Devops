FROM node:12-alpine
RUN apk add --no-cache python2 g++ make
WORKDIR /app
COPY . .
CMD ["node", "app.js"]
EXPOSE 1000