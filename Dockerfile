FROM node:20-alpine

# Install git and other build dependencies
RUN apk add --no-cache git

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
