# Stage 1: Use a Node.js image to install dependencies
FROM node:14-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY max-firstdecent-panel/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY max-firstdecent-panel .

# Build the application (if needed)
# RUN npm run build  # Uncomment if you have a build step

# Stage 2: Use the Grafana image
FROM grafana/grafana:latest

# Create the plugin directory
RUN mkdir -p /var/lib/grafana/plugins/max-firstdecent-panel

# Copy the built files from the previous stage
COPY --from=build /app /var/lib/grafana/plugins/max-firstdecent-panel
