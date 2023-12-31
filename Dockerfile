FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY . .

# Create a new user with UID 10014
#RUN addgroup -g 10014 choreo && \
#    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser
# Set a non-root user
USER 10014

EXPOSE 8080
CMD [ "node", "server.js" ]
