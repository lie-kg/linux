#!/bin/bash

# ===============================
#  LocaltoNet Installer Script
#  Made by Hopingboyz
# ===============================

clear

echo -e "\e[36m"
cat << "EOF"

  _         ____     _____              _        _______    ____    _   _   ______   _______ 
 | |       / __ \   / ____|     /\     | |      |__   __|  / __ \  | \ | | |  ____| |__   __|
 | |      | |  | | | |         /  \    | |         | |    | |  | | |  \| | | |__       | |   
 | |      | |  | | | |        / /\ \   | |         | |    | |  | | | . ` | |  __|      | |   
 | |____  | |__| | | |____   / ____ \  | |____     | |    | |__| | | |\  | | |____     | |   
 |______|  \____/   \_____| /_/    \_\ |______|    |_|     \____/  |_| \_| |______|    |_|   
                                                                                             
                                                                                        

                        LocaltoNet Installer
                     Made with ❤️  by lie_kg
EOF
echo -e "\e[0m"

echo "--------------------------------------------------"
echo "🔹 Checking root permission..."
echo "--------------------------------------------------"

if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run this script as root (sudo)"
  exit 1
fi

echo "✅ Root permission confirmed"
sleep 1

echo
echo "--------------------------------------------------"
echo "⬇️  Installing LocaltoNet..."
echo "--------------------------------------------------"

curl -fsSL https://localtonet.com/install.sh | sh

if [ $? -ne 0 ]; then
  echo "❌ LocaltoNet installation failed"
  exit 1
fi

echo
echo "✅ LocaltoNet installed successfully!"
echo

echo "--------------------------------------------------"
echo "🔐 Authentication Setup"
echo "--------------------------------------------------"

read -p "👉 Enter your LocaltoNet Auth Token: " LTN_TOKEN

if [ -z "$LTN_TOKEN" ]; then
  echo "❌ Token cannot be empty"
  exit 1
fi

localtonet --authtoken "$LTN_TOKEN"

if [ $? -ne 0 ]; then
  echo "❌ Token authentication failed"
  exit 1
fi

echo
echo "--------------------------------------------------"
echo "🎉 Setup Completed Successfully!"
echo "--------------------------------------------------"
echo "✔ LocaltoNet is installed"
echo "✔ Token authenticated"
echo
echo "🚀 You can now start tunnels using:"
echo "   localtonet http 80"
echo "   localtonet tcp 25565"
echo
echo "✨ Script by lie_kg"
echo "--------------------------------------------------"
