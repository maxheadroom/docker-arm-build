FROM debian:jessie
MAINTAINER Falko Zurell <falko.zurell@ubirch.com>

LABEL description="uBirch ARM/NXP build container"
RUN apt-get update && apt-get install  gcc-arm-none-eabi cgdb wget xz-utils git make graphviz -y && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt
RUN wget "https://cmake.org/files/v3.6/cmake-3.6.1-Linux-x86_64.tar.gz"
RUN tar xvfz cmake-3.6.1-Linux-x86_64.tar.gz
RUN cp -R cmake-3.6.1-Linux-x86_64/* /usr/
RUN wget "http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.11.linux.bin.tar.gz"
RUN tar xvfz doxygen-1.8.11.linux.bin.tar.gz
RUN cp doxygen-1.8.11/bin/* /usr/bin
RUN git config --system user.name Docker && git config --system user.email docker@localhost

RUN mkdir /build
VOLUME /build
WORKDIR /build
