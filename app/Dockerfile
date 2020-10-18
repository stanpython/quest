FROM node:10

WORKDIR /usr/src/app

COPY . /usr/src/app

ENV SECRET_WORD TwelveFactor 

RUN npm install

EXPOSE 3000

ENTRYPOINT [ "npm", "start" ]