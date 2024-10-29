#!/bin/bash

# Create a directory for global npm packages
mkdir -p ~/.npm-global

# Configure npm to use the new directory for global installations
npm config set prefix '~/.npm-global'

# Add the new directory to your system PATH
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc

# Install Azure Functions Core Tools globally
npm install -g azure-functions-core-tools@4 --unsafe-perm true

