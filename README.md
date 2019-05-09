# LaserWeb Docker File for Raspberry Pi 

# LaserWeb 

LaserWeb / CNCWeb 4.0 is an application for:

    generating GCODE from DXF/SVG/BITMAP/JPG/PNG files for Lasers and CNC Mills (= CAM Operations)
    controlling a connected CNC / Laser machine (running one of the supported firmwares)


https://laserweb.yurl.ch/

# LaserWeb  wiki

https://github.com/LaserWeb/LaserWeb4/wiki


#build docker image

install git : 

sudo apt-get install git

Build with docker :

sudo docker build -t lijah/laserweb-armf github.com/rmesnard/LaserWeb-armf

#install

create volume :

sudo docker volume create laserweb_config

#run 

sudo docker run -d --name laserweb \
-v laserweb_config:/data \
--privileged \
--device=/dev/ttyUSB0 \
lijah/laserweb-armf



