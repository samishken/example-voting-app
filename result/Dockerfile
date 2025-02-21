FROM node:18-slim

# add curl for healthcheck
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl tini && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/app

# have nodemon available for local dev use (file watching)
RUN npm install -g nodemon

# Copy package.json to docker image
COPY package*.json ./  

RUN npm ci && \
 npm cache clean --force && \
 mv /usr/local/app/node_modules /node_modules

COPY . .

ENV PORT=80
EXPOSE 80

# Use tini as the entrypoint to ensure proper signal handling
# to start the node server
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["node", "server.js"]
