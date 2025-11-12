#!/bin/bash

# NEGAX SENDER (SUPREME) 1.5.15
# Installer script (Ubuntu 22.04.4 LTS)
# (Added interactive disclaimer acceptance - user must type "I AGREE" to proceed)

echo "==============================================="
echo "       NEGAX SENDER (SUPREME) 1.5.15"
echo "==============================================="
echo ""

# DISCLAIMER - read carefully
cat <<'EOF'
=======================================================================
DISCLAIMER

This NEGAX SENDER tool is designed as an educational and learning tool to explore
and understand how email sender process works. You represent and warrant that
you will be entirely responsible for your use of this Email Sender Tool and
that you will use it ethically and in compliance with all applicable laws and
regulations.

The user of this tool will not hold the developer liable in the occasion of
being used for activities that may be listed but not limited to spamming,
phishing, identity theft, invading privacy and causing a disturbance to others
by any means. The user takes full responsibility for any unwanted activity and
their consequences, whether beneficial or harmful.

Use of the tool can lead to severe legal problems. You need to make sure that
you use this Email Sender Tool in accordance with all the legal standards and
regulations. The tool over-all sending limit is 150 emails every few seconds
because the maximum quota for sending email out to other users is 10 per hour.
Over-use of this tool is not allowed.

This tool is meant to be primarily educational, so please use it mindfully,
responsibly, and in ways that are respectful to others.

=======================================================================
EOF
echo ""

# Require explicit acceptance before running the installer
read -p "Type 'I AGREE' to accept the disclaimer and continue with installation: " AGREEMENT
if [ "$AGREEMENT" != "I AGREE" ]; then
    echo "You did not accept the disclaimer. Installation cancelled."
    exit 1
fi

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
  libgdk-pixbuf2.0-0 libgtk-3-0 tk-dev libncurses5-dev libncursesw5-dev pandoc unzip \
  libreoffice libreoffice-writer libreoffice-draw libreoffice-impress libreoffice-common \
  pdf2svg poppler-utils

sudo apt install -y pdf2svg
sudo apt install -y poppler-utils
sudo add-apt-repository ppa:libreoffice/ppa -y
sudo apt update
sudo apt install libreoffice -y

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
