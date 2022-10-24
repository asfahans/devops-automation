#Specify a base image
From node:alpine

WORKDIR /app

#Install some dependencies
COPY package.json .

RUN npm install

COPY . .

#Default Commands
CMD ["npm", "start"]