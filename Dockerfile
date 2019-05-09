FROM arm32v7/node

# add support for gpio library

#RUN apt-get install python-rpi.gpio

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
RUN mkdir /data

WORKDIR /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN useradd --home-dir /usr/src/node-red --no-create-home node-red \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /usr/src/node-red

USER node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install


RUN git clone https://github.com/LaserWeb/lw.comm-server.git
RUN cd lw.comm-server
RUN npm install serialport --unsafe-perm --build-from-source
RUN npm install


# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules


CMD ["npm", "start", "--", "--userDir", "/data"]