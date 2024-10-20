# Use the official Node.js image from the Docker Hub
FROM node:14

# Create and set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json /app/
RUN npm install

# Copy the rest of the application files
COPY . /app

# Expose the application on port 3000
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
