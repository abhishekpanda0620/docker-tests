# Technology Stack

## Runtime & Framework
- **Node.js**: v24 (Alpine-based for production)
- **Express.js**: ^4.18.2 - Web framework for REST API

## Build System & Containerization
- **Docker**: Primary deployment method with multi-platform support
- **Docker Buildx**: Required for cross-platform builds
- **Multi-stage Dockerfile**: Optimized builds with builder and production stages

## Target Platforms
- linux/amd64 (Intel/AMD 64-bit)
- linux/arm64 (ARM 64-bit)

## Common Commands

### Development
```bash
npm start          # Start the application
npm run dev        # Development mode (same as start)
npm run build      # Build command (placeholder)
```

### Docker Operations
```bash
# Multi-platform build and push
./build-multiplatform.sh

# Manual buildx commands
docker buildx create --name multiplatform-builder --use
docker buildx build --platform linux/amd64,linux/arm64 --tag registry/image:tag --push .
docker buildx imagetools inspect registry/image:tag
```

## Security Practices
- Non-root user execution (nextjs:nodejs)
- Security updates via apk
- dumb-init for proper signal handling
- Minimal Alpine base images