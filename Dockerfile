FROM arm32v7/node:6.17-stretch

# add support for gpio library

#COPY package.json /app
# LaserWeb


RUN npm install serialport --unsafe-perm --build-from-source

RUN git clone https://github.com/LaserWeb/lw.comm-server.git

WORKDIR /lw.comm-server
RUN npm install

#WORKDIR /app
#COPY package.json /app
#RUN npm install
#COPY . /app

RUN ls

CMD node server.js
EXPOSE 8000