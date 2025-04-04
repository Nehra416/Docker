# Base OS for the image
FROM ubuntu

# Install the node js v18 for the image
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

# below this all cmd run inside the app dir
WORKDIR /app

# Copy Code from local machine to the image
COPY package.json package.json
COPY package-lock.json package-lock.json

# install the node modules for image
RUN npm install

COPY index.js index.js

# Start point of the node js
ENTRYPOINT ["node", "index.js"]
