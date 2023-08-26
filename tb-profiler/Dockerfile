FROM debian:11

USER root
WORKDIR $HOME
RUN apt-get update && apt-get install -y wget unzip
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -f -p $HOME/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh
RUN $HOME/miniconda/bin/conda install -y -c bioconda tb-profiler=5.0.0
