FROM debian:11

USER root

ENV ULOCAL=/usr/local/bin
ENV NXF_VER=23.04.2

RUN apt-get update && apt-get install -y ca-certificates-java curl
RUN apt-get install -y default-jdk
RUN cd $HOME && \
    curl -s https://get.nextflow.io | bash && \
    chmod +x $HOME/nextflow && \
    ln -s $HOME/nextflow $ULOCAL/nextflow

WORKDIR /data/
