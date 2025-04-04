## 1st way of creating an image--

## Base OS for the image
```
FROM ubuntu
```

## Install the node js v18 for the image
```
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
```

## Copy Code from local machine to the image
```
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js
```

## install the node modules for image
```
RUN npm install
```

## Start point of the node js
```
ENTRYPOINT ["node", "index.js"]
```


## by direct install node like (FROM node) we can skip the first 10 steps or layers

## if we run build cmd again without any changes then it become complete very fast because it cached the layers
## if we make changes in index.js then layer 14 of COPY index.js and all after this is rebuild not taking from the cache
## So for making optimize always write the default/fixed layers on the top that if code is changed they won't be rebuild



# 2nd way, copy code inside a dir (preferd way)

# Base OS for the image
FROM ubuntu

# Install the node js v18 for the image
```
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
```

# Copy Code from local machine to the image
```
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
```

# install the node modules for image
```
RUN cd app && npm install


COPY index.js /app/index.js
```

# Start point of the node js
```
ENTRYPOINT ["node", "/app/index.js"]
```
