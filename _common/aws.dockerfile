ARG IMAGE_NAME
ARG IMAGE_TAG
FROM ${IMAGE_NAME}:${IMAGE_TAG}

RUN apt-get update
RUN apt-get install -y gettext-base
RUN apt-get clean

ENV PATH=/opt/bin:$PATH
ENV PATH=/opt/conda/bin:$PATH

COPY _common/entrypoint.aws.sh /opt/bin/entrypoint.aws.sh
RUN chmod +x /opt/bin/entrypoint.aws.sh

WORKDIR /scratch

ENTRYPOINT ["entrypoint.aws.sh"]
