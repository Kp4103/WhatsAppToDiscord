# syntax=docker/dockerfile:1

FROM node:16-alpine
WORKDIR /usr/local/WA2DC

# Set environment variable for token
ENV WA2DC_TOKEN=CHANGE_THIS_TOKEN

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Ensure port 4000 is exposed (or use the port you set in your code)
EXPOSE 4000

# Start the application
ENTRYPOINT ["node", "src/index.js"]
