docker system info | grep Username
#!/bin/bash

# Multi-platform Docker build script
# This script builds and pushes Docker images for multiple architectures

set -e

IMAGE_NAME="myapp"
TAG="latest"
REGISTRY="abhishek626/" 

echo "🚀 Starting multi-platform build..."

# Create and use buildx builder if it doesn't exist
if ! docker buildx ls | grep -q multiplatform-builder; then
    echo "📦 Creating buildx builder..."
    docker buildx create --name multiplatform-builder --use
fi

# Build for multiple platforms
echo "🔨 Building for linux/amd64 and linux/arm64..."
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag ${REGISTRY}${IMAGE_NAME}:${TAG} \
    --push \
    .

echo "✅ Multi-platform build completed!"
echo "📋 Built platforms: linux/amd64, linux/arm64"

