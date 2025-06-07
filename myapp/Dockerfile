FROM node
LABEL np.com.techaxis.version=1.0
WORKDIR /var/node
COPY ./weather-app  /var/node
RUN npm install
COPY ./weather-app /var/node
EXPOSE 3000
CMD [ "node", "./bin/www"]


