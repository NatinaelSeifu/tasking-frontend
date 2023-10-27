FROM node:alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ENV REACT_APP_API_KEY=${REACT_APP_API_KEY}

ENV PATH /app/node_modules/.bin:$PATH

EXPOSE 3000

CMD ["npm", "start"]
