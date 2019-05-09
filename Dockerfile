FROM arm32v7/node:6.17-stretch

# add support for gpio library
WORKDIR /app

#COPY package.json /app
# LaserWeb
RUN git clone https://github.com/LaserWeb/lw.comm-server.git
#RUN cd lw.comm-server 
RUN npm install serialport --unsafe-perm --build-from-source
RUN npm install

#WORKDIR /app
#COPY package.json /app
#RUN npm install
#COPY . /app

CMD node server.js
EXPOSE 8000