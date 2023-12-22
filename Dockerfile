# Use the official Golang image with Alpine Linux as the base image
FROM golang:1.15-alpine

# Set the working directory inside the container
WORKDIR /go/src/github.com/dicodingacademy/karsajobs

# Enable Go modules and set environment variables
ENV GO111MODULE=on
ENV APP_PORT=8080

# Copy Go module files and download dependencies
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the entire project into the container
COPY . .

# Create a build directory and build the Go application
RUN mkdir /build; \
    go build -o /build/ ./...

# Expose port 8080 for external access
EXPOSE 8080

# Define the command to run the application
CMD ["/build/web"]
