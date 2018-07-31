FROM node:8

# Create app directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY client/package.json /app/client/package.json
COPY server/package.json /app/server/package.json
# COPY server/package.json ./server

RUN cd /app/client && npm install
RUN cd /app/server && npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY client/ /app/client
COPY server/ /app/server
# COPY ./server ./server

EXPOSE 8080
CMD [ "node", "server/app.js" ]
