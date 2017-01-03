FROM nimmis/alpine-java

MAINTAINER nimmis <kjell.havneskold@gmail.com>

#default directory for SPIGOT-server
ENV SPIGOT_HOME /tmp/spigot

#default version 
ENV SPIGOT_VER latest

# add extra files needed
COPY rootfs /

# add some needed commands 
RUN apk update && apk upgrade && \
    apk add wget git && \
	rm -rf /tmp/tmprt /var/cache/apk/*

# Make special user for minecraft to run in

RUN useradd -s /bin/bash -d /minecraft -m minecraft

# expose minecraft port
EXPOSE 25565


