# Use the base Grafana image
FROM grafana/grafana:latest

# Install Node.js and npm
RUN apt-get update && apt-get install -y nodejs npm

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

# Start Grafana
CMD ["/run.sh"]