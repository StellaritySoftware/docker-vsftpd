FROM ubuntu:17.10
MAINTAINER Sergey Podobry <sergey.podobry@stellaritysoftware.com>
LABEL Description="vsftpd prepopulated image for testing"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# install packages
RUN apt-get update && apt-get install -y --no-install-recommends vsftpd && rm -rf /var/lib/apt/lists/*

# create user one
RUN useradd -m one && echo one:one | chpasswd

# create user two (passwordless)
RUN useradd -m two
RUN sed -i 's/two:!:/two:$1$VNMbpxGH$sew7cnwH9ixU.x27UbFNn.:/' /etc/shadow

# create anonymous home directory
RUN mkdir /var/ftp && mkdir /var/ftp/pub && chown ftp:ftp /var/ftp/pub

# copy configs
ADD root /

# create entrypoint
ENTRYPOINT ["/bootstrap.sh"]

# expose ports
EXPOSE 21 900 21000-21010