# Use the official Node.js image with Alpine Linux as the base image for the builder stage
FROM node:14.21-alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project into the container
COPY . .

# Build the application
RUN npm run build

# Expose port 8000 for external access
EXPOSE 8000

# Define the command to run the application
CMD [ "npm", "run", "serve" ]
