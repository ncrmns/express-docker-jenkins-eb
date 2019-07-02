FROM node:10
WORKDIR application/
COPY package*.json ./
RUN npm install
COPY . ./
EXPOSE 8080
CMD ["npm", "start"]