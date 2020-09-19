FROM ubuntu:latest
ARG config
ARG DEBIAN_FRONTEND=noninteractive
RUN \
apt-get update && \
apt-get install -y \
gcc g++ build-essential libncurses5-dev wget unzip rsync cpio bc git vim

RUN apt-get autoclean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

RUN \
useradd -m develop && \
echo "develop:Develop!1" | chpasswd && adduser develop

WORKDIR /home/develop
USER develop
RUN git clone --depth=1 git://git.buildroot.net/buildroot buildroot;mkdir buildroot-output
COPY ${config} buildroot-output/.config
