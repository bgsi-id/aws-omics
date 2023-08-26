#!/bin/bash
set -e

IMAGE_NAME=$1
IMAGE_TAG=$2

echo "Docker Login to ECR"
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_USER}.dkr.ecr.${AWS_REGION}.amazonaws.com

REPOSITORY=${AWS_USER}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}
echo "Image repository: $REPOSITORY"

# echo "Tagging container image for ECR"
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${REPOSITORY}:${IMAGE_TAG}
docker tag ${IMAGE_NAME}:latest ${REPOSITORY}:latest

# echo "Pushing container images to ECR"
docker push ${REPOSITORY}