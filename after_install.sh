RED='\e[1;31m'
YELLOW='\e[1;33m'
GREEN='\e[1;32m'
clear

echo -e "\e[1;31m========== UPDATE OS ==========\e[0m"
apt-get update
sleep 5
clear

# BUILD TOOLS
echo -e "\e[1;31m========== BUILD TOOLS ==========\e[0m"
if [ $(dpkg-query -W -f='${Status}' build-essential libssl-dev 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "$YELLOW========== INSTALLING BUILD TOOLS ==========\e[0m"
    apt-get install -y build-essential libssl-dev;
    echo "$GREEN========== FINISHED INSTALLING BUILD TOOLS ==========\e[0m"
else
    echo "$GREEN========== BUILD TOOLS ALREADY INSTALLED ==========\e[0m"
fi
clear

# GIT
echo "$RED========== GIT ==========\e[0m"
if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "$YELLOW========== INSTALLING GIT ==========\e[0m"
    apt-get install -y git;
    git config --global user.name "Miguel Rodriguez"
    git config --global user.email mrodrigueznav@gmail.com
    echo "$GREEN========== FINISHED INSTALLING GIT ==========\e[0m"
else
    git config --global user.name "Miguel Rodriguez"
    git config --global user.email mrodrigueznav@gmail.com
    echo "$GREEN========== GIT ALREADY INSTALLED ==========\e[0m"
fi
clear

# FIRACODE
echo "$RED========== FIRACODE ==========\e[0m"
if [ $(dpkg-query -W -f='${Status}' fonts-firacode 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "$YELLOW========== INSTALLING FIRACODE ==========\e[0m"
    apt-get install -y fonts-firacode;
    echo "$GREEN========== FINISHED INSTALLING FIRACODE ==========\e[0m"
else
    echo "$GREEN========== FIRACODE ALREADY INSTALLED ==========\e[0m"
fi
clear

# NVM NODE
echo -e "$RED========== NODE 10.14.1 VIA NVM ==========\e[0m"
if command -v nvm >/dev/null:
then
    echo "$YELLOW========== INSTALLING NODE ==========\e[0m"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
    source ~/.profile
    nvm install 10.14.1
    nvm use 10.14.1
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo "$GREEN========== FINISHED INSTALLING NODE ==========\e[0m"
else
    echo "$GREEN========== NVM ALREADY INSTALLED ==========\e[0m"
fi
clear

# SNAP CODE
echo -e "$RED========== SNAP CODE ==========\e[0m"
if command snap list code >/dev/null:
then
    echo "$GREEN========== SNAP CODE ALREADY INSTALLED ==========\e[0m"
else
    echo "$YELLOW========== INSTALLING SNAP CODE ==========\e[0m"
    snap install code --classic
    echo "$GREEN========== FINISHED INSTALLING SNAP CODE ==========\e[0m"
fi
clear

# SNAP POSTMAN
echo -e "$RED========== SNAP POSTMAN ==========\e[0m"
if command snap list postman >/dev/null:
then
    echo "$GREEN========== SNAP POSTMAN ALREADY INSTALLED ==========\e[0m"
else
    echo "$YELLOW========== INSTALLING SNAP POSTMAN ==========\e[0m"
    snap install postman
    echo "$GREEN========== FINISHED INSTALLING SNAP POSTMAN ==========\e[0m"
fi
clear

# SNAP CHROMIUM
echo -e "$RED========== SNAP CHROMIUM ==========\e[0m"
if command snap list chromium >/dev/null:
then
    echo "$GREEN========== SNAP CHROMIUM ALREADY INSTALLED ==========\e[0m"
else
    echo "$YELLOW========== INSTALLING SNAP CHROMIUM ==========\e[0m"
    snap install chromium
    echo "$GREEN========== FINISHED INSTALLING SNAP CHROMIUM ==========\e[0m"
fi
clear

# SNAP BEEKEEPER-STUDIO
echo -e "$RED========== SNAP BEEKEEPER-STUDIO ==========\e[0m"
if command snap list beekeeper-studio >/dev/null:
then
    echo "$GREEN========== SNAP BEEKEEPER-STUDIO ALREADY INSTALLED ==========\e[0m"
else
    echo "$YELLOW========== INSTALLING SNAP BEEKEEPER-STUDIO ==========\e[0m"
    snap install beekeeper-studio
    echo "$GREEN========== FINISHED INSTALLING SNAP BEEKEEPER-STUDIO ==========\e[0m"
fi
clear

# INSTALL GOOGLE CHROME KEY, REPO AND PACKAGE
echo -e "$RED========== INSTALL GOOGLE CHROME KEY, REPO AND PACKAGE ==========\e[0m"
if [ $(dpkg-query -W -f='${Status}' google-chrome-stable 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "$GREEN========== GOOGLE CHROME KEY, REPO AND PACKAGE ALREADY INSTALLED ==========\e[0m"
else
    echo "$YELLOW========== INSTALLING GOOGLE CHROME KEY, REPO AND PACKAGE ==========\e[0m"
    echo "$YELLOW========== CHROME REPO KEY ==========\e[0m"
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub |  apt-key add -
    echo "$YELLOW========== CHROME REPO SETUP ==========\e[0m"
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
    >> /etc/apt/sources.list.d/google.list'
    apt update
    echo "$YELLOW========== INSTALL CHROME ==========\e[0m"
    apt install google-chrome-stable
    echo "$GREEN========== FINISHED INSTALLING CHROME ==========\e[0m"
fi
clear

# # GENERATE SSH KEY
# echo -e "$RED========== GENERATE SSH KEY ==========\e[0m"
# if
# then
#     echo
# else
#     echo
# fi
# clear

# ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null
# sleep 5
# echo -e "\e[1;31m========== INSTALL PIPENV ==========\e[0m"
# echo Type 1 to install PIPENV
# read varname
# if varname = 1
# then
#     apt install pipenv
# if
# sleep 5