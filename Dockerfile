FROM nimmis/ubuntu

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# set default java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

#default directory for SPIGOT-server
ENV SPIGOT_HOME /tmp/spigot

# Directory where the server should run
ENV MC_DIR /minecraft/

#default version 
ENV SPIGOT_VER latest

# add extra files needed
COPY rootfs /

# add some needed commands 
RUN apt-get install -y software-properties-common && \
	add-apt-repository ppa:openjdk-r/ppa -y && \
	apt-get update && \
	apt-get install -y --no-install-recommends openjdk-8-jre wget git && \
	rm -rf /var/lib/apt/lists/* && \
	apt-get clean all

# Make special user for minecraft to run in

RUN useradd -s /bin/bash -d /minecraft -m minecraft

# expose minecraft port
EXPOSE 25565


