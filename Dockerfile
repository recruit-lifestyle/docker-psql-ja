FROM ubuntu:16.04

RUN apt-get -qq update && \
  apt-get -qqy upgrade && \
  apt-get clean

# Install postgresql client
RUN apt-get -y install postgresql-client

# Change location into Japanese
RUN apt-get -y install language-pack-ja-base language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"

# Change timezone
# This does not work. It might be the problem which stackoverflow says.
# https://stackoverflow.com/questions/43907925/ubuntu-timedatectl-fails-in-docker-container
# RUN timedatectl set-timezone Asia/Tokyo
# Fix by https://stackoverflow.com/questions/40234847/docker-timezone-in-ubuntu-16-04-image
RUN apt-get install -y tzdata && \
  rm -rf /var/lib/apt/lists/* && \
  echo "Asia/Tokyo" > /etc/timezone && \
  rm /etc/localtime && \
  ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata

# Create and change dummy user(europa)
RUN useradd -ms /bin/bash europa
WORKDIR /home/europa

# Change user as europa
USER europa
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
ENV HOME /home/europa
