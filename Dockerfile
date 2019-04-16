FROM node:lts-alpine
LABEL maintainer="Mrityunjay.Mukherjee@gmail.com"
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
# update npm
RUN npm install npm@latest -g
# If you are building your code for production
# RUN npm install --only=production
RUN npm install --only=production
# Bundle app source
COPY . .
EXPOSE 5000
CMD [ "npm","start" ]