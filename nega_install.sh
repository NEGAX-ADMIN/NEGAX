#!/bin/bash

# NEGAX SENDER (SUPREME) 1.5.22.1
# Installer script (Ubuntu 24.04.4 LTS)
# (Added interactive disclaimer acceptance - user must type "I AGREE" to proceed)

echo "==============================================="
echo "       NEGAX SENDER (SUPREME) 1.5.22.1"
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
echo " THIS SCRIPT IS ONLY FOR UBUNTU OS (Ubuntu 24.04.4 LTS)"
echo " Ensure that you are running this script on Ubuntu 24.04.4 LTS."
echo "==============================================="
echo ""

# Make the nega script executable
chmod +x ./nega

# Run the full Linux runtime setup. This installs required system packages,
# Microsoft Edge, LibreOffice, Pandoc, PDF tools, and prepares the runtime.
sudo ./nega setup-runtime

# Run Playwright setup explicitly to make sure browser runtime files are installed.
./nega setup-playwright

echo ""
echo "==============================================="
echo "Installation complete."
echo "==============================================="
echo ""
echo "To check installed runtime dependencies, run:"
echo "  ./nega check-runtime"
echo ""
echo "To run the application, use:"
echo "  ./nega"
echo ""
echo "Optional: If you need Outlook login with a visible browser on VPS, run:"
echo "  sudo ./nega setup-vnc"
echo "  vncpasswd"
echo "  negax-vnc-start"
echo ""
echo "To stop VNC later, run:"
echo "  negax-vnc-stop"
echo "==============================================="
echo " NEGA WISHES YOU GOOD LUCK "
echo "==============================================="

read -p "Step 7 complete. Press Enter to finish the installation..."

