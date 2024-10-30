#!/bin/bash

# Check to see if lines have already been added to the ~/.bashrc
line_to_check='# Azure Cloud Shell Information for MGMT 59000'

# Check if the line is already in .bashrc
if ! grep -Fxq "$line_to_check" ~/.bashrc; then
    # If the line is not found, add contents to .bashrc

    # Add instructions to students in the .bashrc so they run on startup
    # ANSI color codes
    BLUE='\033[34m'
    BOLD='\033[1m'
    RESET='\033[0m'

    # Create the formatted lines
    cat << 'EOT' >> ~/.bashrc

# Azure Cloud Shell Information for MGMT 59000
echo -e ""
echo -e "=== NOTES FOR MGMT 59000 CLOUD COMPUTING ==="
echo -e "- Remember to use the CLASSIC version of Azure Cloud Shell! Go to Settings > 'Go to Classic version'"
echo -e "- To start your Python virtual environment, type the command \e[1;34mstart_venv\e[0m"
echo -e "- To install Azure Cloud Function Tools, type the command \e[1;34minstall_afct\e[0m"
echo -e "==="
echo -e ""

EOT

    # Update the .bashrc file to add the command to install AFCT
    echo "alias install_afct='~/clouddrive/afct/install_afct.sh'" >> ~/.bashrc

    # Update the .bashrc file to add the command to start the `cf_env` Python virtual environment
    echo "alias start_venv='python -m venv ~/tmp/cf_env;source ~/tmp/cf_env/bin/activate'" >> ~/.bashrc

fi

source ~/.bashrc