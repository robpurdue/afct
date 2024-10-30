#!/bin/bash

# Create a directory for global npm packages
mkdir -p ~/.npm-global

# Configure npm to use the new directory for global installations
npm config set prefix '~/.npm-global'

# Add the new directory to your system PATH
# Define the line to be added
line_to_add='export PATH=~/.npm-global/bin:$PATH'

# Check if the line is already in .bashrc
if ! grep -Fxq "$line_to_add" ~/.bashrc; then
    # If the line is not found, add it to .bashrc
    echo "$line_to_add" >> ~/.bashrc
fi

# Install Azure Functions Core Tools globally
npm install -g azure-functions-core-tools@4 --unsafe-perm true

source ~/.bashrc