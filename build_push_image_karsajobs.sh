#!/bin/bash

# Load environment variables from .env file
source .env

# Build Docker image
docker build -t karsajobs:latest .

# List local images
docker images

# Rename the image to match Github Container Registry format
docker tag karsajobs:latest ghcr.io/$GITHUB_USERNAME/karsajobs:latest

# Login to Github Packages
docker login ghcr.io -u $GITHUB_USERNAME -p $GITHUB_TOKEN

# Push the image to Github Container Registry
docker push ghcr.io/$GITHUB_USERNAME/karsajobs:latest