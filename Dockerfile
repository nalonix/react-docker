# syntax=docker/dockerfile:1
ARG NODE_VERSION=20.10.0

FROM node:${NODE_VERSION}-alpine

# Set environment to development (to include devDependencies)
ENV NODE_ENV development

WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the source code
COPY . .

# Use a non-root user
USER node

# Expose the port Vite runs on
EXPOSE 5173

# Start the development server
CMD ["npm", "run", "dev"]
