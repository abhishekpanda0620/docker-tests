# Multi-Platform Docker Application

A simple Node.js Express application demonstrating multi-platform Docker builds for AMD64 and ARM64 architectures.

## Quick Start

### Run with Docker (Recommended)
```bash
docker run -p 3000:3000 abhishek626/myapp:latest
```

### Run Locally
```bash
npm install
npm start
```

Visit `http://localhost:3000` to see platform information.

## API Endpoints

- `GET /` - Platform information (OS, architecture, hostname, uptime)
- `GET /health` - Health check endpoint

## Multi-Platform Build

### Automated Build
```bash
chmod +x build-multiplatform.sh
./build-multiplatform.sh
```

### Manual Build
```bash
# Create buildx builder
docker buildx create --name multiplatform-builder --use

# Build for multiple platforms
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag abhishek626/myapp:latest \
    --push \
    .
```

## Project Structure

```
multi-platform-builds/
├── build-multiplatform.sh    # Multi-platform Docker build script
├── Dockerfile               # Multi-stage, multi-platform container definition
├── index.js                # Main Express.js application entry point
├── package.json            # Node.js dependencies and scripts
└── README.md               
```

## Features

- **Multi-platform support**: Builds for both AMD64 and ARM64 architectures
- **Security hardened**: Non-root user, minimal Alpine base image
- **Multi-stage build**: Optimized for production deployment
- **Platform detection**: Shows runtime platform information
- **Health checks**: Built-in health endpoint for monitoring

## Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build (placeholder)
npm run build
```

## Docker Features

- Multi-stage build for optimized image size
- Cross-platform build arguments
- Security updates and non-root user
- Proper signal handling with dumb-init
- Efficient layer caching

## Testing Multi-Platform

After building, verify the manifest includes both architectures:
```bash
docker buildx imagetools inspect abhishek626/myapp:latest
```

## Requirements

- Docker with buildx support
- Node.js 24+ (for local development)
- Docker Hub account (for pushing images)