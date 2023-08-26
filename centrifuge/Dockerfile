FROM ubuntu:20.04

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y centrifuge || apt-get install -y centrifuge) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
