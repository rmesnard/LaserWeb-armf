FROM arm32v7/node

# add support for gpio library

# LaserWeb
RUN git clone https://github.com/LaserWeb/lw.comm-server.git
RUN cd lw.comm-server 
RUN npm install serialport --unsafe-perm --build-from-source
RUN npm install

# Container config
EXPOSE 8000
WORKDIR /lw.comm-server
ENTRYPOINT nodejs server.js