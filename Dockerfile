FROM debian:jessie
MAINTAINER Falko Zurell <falko.zurell@ubirch.com>

LABEL description="uBirch ARM/NXP build container"
RUN apt-get update && apt-get install  gcc-arm-none-eabi cgdb wget xz-utils git cmake doxygen graphviz -y && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt
RUN git config --system user.name Docker && git config --system user.email docker@localhost

RUN mkdir /build
VOLUME /build
WORKDIR /build
