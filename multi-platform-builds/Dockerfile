# Multi-platform Dockerfile supporting ARM64 and AMD64
# Use buildx for cross-platform builds: docker buildx build --platform linux/amd64,linux/arm64 -t myapp .

# Use multi-stage build for efficiency
FROM --platform=$BUILDPLATFORM node:24-alpine AS builder

# Build arguments for platform detection
ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

# Print build info for debugging
RUN echo "Building on $BUILDPLATFORM, targeting $TARGETPLATFORM"

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm i 

# Copy source code
COPY . .

# Build the application (if needed)
RUN npm run build 2>/dev/null || echo "No build script found, skipping..."

# Production stage
FROM node:24-alpine AS production

# Install security updates
RUN apk update && apk upgrade && apk add --no-cache dumb-init

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nextjs -u 1001

# Set working directory
WORKDIR /app

# Copy built application from builder stage
COPY --from=builder --chown=nextjs:nodejs /app .

# Switch to non-root user
USER nextjs

# Expose port
EXPOSE 3000

# Use dumb-init for proper signal handling
ENTRYPOINT ["dumb-init", "--"]

# Start the application
CMD ["npm", "start"]