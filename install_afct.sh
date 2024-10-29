#!/bin/bash

# Create a directory for global npm packages
mkdir -p ~/.npm-global

# Configure npm to use the new directory for global installations
npm config set prefix '~/.npm-global'

# Add the new directory to your system PATH
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc

# Install Azure Functions Core Tools globally
npm install -g azure-functions-core-tools@4 --unsafe-perm true

# Update the .bashrc file to add the command to install AFCT
echo "alias install_afct='~/clouddrive/afct/install_afct.sh'" >> ~/.bashrc

# Update the .bashrc file to add the command to start the `cf_env` Python virtual environment
echo "alias start_venv='python -m venv ~/tmp/cf_env;source ~/tmp/cf_env/bin/activate'" >> ~/.bashrc

# Add instructions to students in the .bashrc so they run on startup
# ANSI color codes
BLUE='\033[34m'
BOLD='\033[1m'
RESET='\033[0m'

# Create the formatted lines
cat << 'EOT' >> ~/.bashrc

# Azure Cloud Shell Information
echo -e "- Remember to use the CLASSIC version of Azure Cloud Shell! Go to Settings > 'Go to Classic version'"
echo -e "- To start your Python virtual environment, type the command \e[1;34mstart_venv\e[0m"
echo -e "- To install Azure Cloud Function Tools, type the command \e[1;34minstall_afct\e[0m"

EOT

source ~/.bashrc