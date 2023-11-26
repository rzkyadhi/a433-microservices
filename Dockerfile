# Use the official Node.js 14 image as the base image
FROM node:14

# Set working directory inside the container
WORKDIR /app

# Copy all source code from host machine to container working directory
COPY . .

# Set Environment Variables for app
ENV NODE_ENV=production 
ENV DB_HOST=item-db

# Install the dependencies and build the app
RUN npm install --production --unsafe-perm && npm run build

# Expose Port 8080
EXPOSE 8080

# Specify the default command to run when the container start
CMD ["npm", "start"]