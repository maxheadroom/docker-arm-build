FROM debian:jessie
MAINTAINER Falko Zurell <falko.zurell@ubirch.com>

LABEL description="uBirch ARM gcc build container"
RUN apt-get update
RUN apt-get install gcc-arm-none-eabi -y
RUN apt-get install cgdb -y
RUN apt-get install wget -y
RUN apt-get install xz-utils -y
RUN apt-get install git -y
RUN apt-get install make -y
RUN apt-get install gcc -y
RUN apt-get install graphviz -y
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
