#!/bin/bash

# Inform the user that this script is only for Ubuntu
echo "==============================================="
echo " THIS SCRIPT IS ONLY FOR UBUNTU OS (Ubuntu 22.04.4 LTS)"
echo " Ensure that you are running this script on Ubuntu 22.04.4 LTS."
echo "==============================================="
echo ""

# Pause before starting the first step
read -p "Press Enter to begin the installation process..."

# Step 1: Install additional required packages
echo "==============================================="
echo "Step 1: Installing required packages..."
echo "==============================================="

sudo apt-get update && sudo apt-get install -y \
  libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxi6 libxtst6 libnss3 \
  libxrandr2 libatk1.0-0 libcups2 libpangocairo-1.0-0 libatk-bridge2.0-0 libdrm2 \
  libgbm1 libasound2 libxshmfence1 libwayland-server0 libwayland-egl1 libdbus-1-3 \
  libgdk-pixbuf2.0-0 libgtk-3-0 tk-dev libncurses5-dev libncursesw5-dev pandoc unzip libreoffice

# Step 2: Download and Install Pandoc
echo "==============================================="
echo "Step 2: Downloading and installing Requirements..."
echo "==============================================="

read -p "Press Enter to begin the installation process..."

wget https://github.com/jgm/pandoc/releases/download/3.2/pandoc-3.2-linux-amd64.tar.gz
sudo tar -xzf pandoc-3.2-linux-amd64.tar.gz
sudo mv pandoc-3.2/bin/pandoc /usr/bin/pandoc
rm -r pandoc-3.2 pandoc-3.2-linux-amd64.tar.gz

# Step 7: Check for template_folder and sender_output directories
echo "==============================================="
echo "Step 7: Checking for existing directories..."
echo "==============================================="

if [ -d "template_folder" ] then
  echo "Both template_folder and sender_output directories exist."
  echo "Only extracting nega from the ZIP file..."
  sudo unzip -j NEGAX_SUPREME_LINUX_1.5.13.zip "nega" -d .

else
  echo "One or both of the required directories are missing."
  echo "Performing a full extraction..."
  sudo unzip NEGAX_SUPREME_LINUX_1.5.13.zip
fi

# Make the nega script executable
chmod +x ./nega

read -p "Step 7 complete. Press Enter to finish the installation..."

# Final step: Inform the user of the completion
echo "==============================================="
echo "Installation complete."
echo "If you don't have a license, purchase directly from the admin or the bot."
echo "To run the application, use './nega' or 'nega'."
echo "Always, to upload a file, start by typing '/root/NEGAX/'"
echo "The rest of the files or directories will show up. Use the arrow keys (⬆⬇) to select."
echo "CTRL + D OR CTRL + C to cancel an operation in the sender."
echo "==============================================="
echo " NEGA WISHES YOU GOOD LUCK "
