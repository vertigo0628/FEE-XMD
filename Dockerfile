FROM node:18-alpine

# Install build dependencies for canvas and other native modules
RUN apk add --no-cache \
    git \
    python3 \
    make \
    g++ \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    musl-dev \
    giflib-dev \
    pixman-dev \
    pangomm-dev \
    libjpeg-turbo-dev \
    freetype-dev

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy application code
COPY . .

# Create session directory if needed
RUN mkdir -p sessions

# Expose port (if your app uses one)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
