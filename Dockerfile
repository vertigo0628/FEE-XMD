FROM node:18-bullseye

# Install build dependencies for canvas and other native modules
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    libpixman-1-dev \
    libpangomm-1.4-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

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
