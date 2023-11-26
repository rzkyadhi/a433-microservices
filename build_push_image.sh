#!/bin/bash

# Load environment variables from .env file
source .env

# Build Docker image
docker build -t item-app:v1 .

# List local images
docker images

# Rename the image to match Github Container Registry format
docker tag item-app:v1 ghcr.io/$GITHUB_USERNAME/item-app:v1

# Login to Github Packages
docker login ghcr.io -u $GITHUB_USERNAME -p $GITHUB_TOKEN

# Push the image to Github Container Registry
docker push ghcr.io/$GITHUB_USERNAME/item-app:v1