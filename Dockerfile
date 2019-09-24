# Create image based on the latest node image
FROM node:latest

# set working directory
RUN mkdir /srv/telerys-front
WORKDIR /srv/telerys-front

# add `/srv/telerys-front/node_modules/.bin` to $PATH
ENV PATH /srv/telerys-front/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /srv/telerys-front/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.8

# add app
COPY . /srv/telerys-front

# start app
CMD ng serve --host 0.0.0.0
