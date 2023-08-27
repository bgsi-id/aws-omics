#!/bin/bash
set -e

IMAGE_SOURCE=$1
IMAGE_NAME=$2
IMAGE_TAG=$3

# retrieve image layer cache from previously built build stage
# docker pull ${IMAGE_SOURCE} || true

docker build \
    --platform linux/amd64 \
    -t ${IMAGE_NAME}:${IMAGE_TAG} \
    -f ${IMAGE_NAME}/Dockerfile .

# build the image with an AWS specific entrypoint
docker build \
    --no-cache \
    --platform linux/amd64 \
    --build-arg IMAGE_NAME=${IMAGE_NAME} \
    --build-arg IMAGE_TAG=${IMAGE_TAG} \
    -t bgsi/${IMAGE_NAME}:${IMAGE_TAG} \
    -t bgsi/${IMAGE_NAME}:latest \
    -f _common/aws.dockerfile .
