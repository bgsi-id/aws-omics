FROM mambaorg/micromamba:1.5

USER root

RUN micromamba install --yes --name base --channel conda-forge --channel bioconda tb-profiler=5.0.0
RUN micromamba clean --all --yes
