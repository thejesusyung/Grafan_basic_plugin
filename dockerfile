# Use the base Grafana image
FROM grafana/grafana:latest

# Switch to root user to install packages
USER root

# Install Node.js and npm using apk (Alpine package manager)
RUN apk add --no-cache nodejs npm

# Create a directory for the plugin
RUN mkdir -p /var/lib/grafana/plugins/max-firstdecent-panel

# Copy the plugin code to the directory
COPY ./max-firstdecent-panel /var/lib/grafana/plugins/max-firstdecent-panel

# Set the working directory
WORKDIR /var/lib/grafana/plugins/max-firstdecent-panel

# Install plugin dependencies
RUN npm install

# Expose Grafana's default port
EXPOSE 3000

# Switch back to Grafana user before running Grafana
USER grafana

# Start Grafana
CMD ["/run.sh"]
