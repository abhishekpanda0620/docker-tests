# Project Structure

## Root Directory Layout
```
multi-platform-builds/
├── build-multiplatform.sh    # Multi-platform Docker build script
├── Dockerfile               # Multi-stage, multi-platform container definition
├── index.js                # Main Express.js application entry point
└── package.json            # Node.js dependencies and scripts
```

## File Responsibilities

### `index.js`
- Main application entry point
- Express server setup with platform detection endpoints
- Health check endpoint at `/health`
- Root endpoint at `/` returns platform information

### `Dockerfile`
- Multi-stage build (builder + production)
- Cross-platform support with build arguments
- Security hardening with non-root user
- Alpine-based for minimal footprint

### `build-multiplatform.sh`
- Automated multi-platform build script
- Creates buildx builder if needed
- Builds for AMD64 and ARM64 simultaneously
- Pushes to registry and inspects manifest

### `package.json`
- Standard Node.js project configuration
- Express.js dependency
- Simple npm scripts for development

## Conventions
- All Docker-related files in project root
- Shell scripts use `.sh` extension and are executable
- Multi-platform builds target both AMD64 and ARM64
- Security-first approach in containerization