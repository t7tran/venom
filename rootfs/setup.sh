#!/bin/bash -ex

apt-get update && apt-get upgrade -y && apt-get install -y curl zip
apt-get install -y xvfb \
                   ca-certificates \
                   unzip \
                   gnupg \
                   libglib2.0-0 \
                   libnss3 \
                   libgtk-4-1 \
                   xdg-utils \
                   libatk-bridge2.0-0 \
                   libasound2t64



#-------------------------------------------------------------------------
# install timezone data --------------------------------------------------
#-------------------------------------------------------------------------
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata



#-------------------------------------------------------------------------
# Installs latest Chrome for puppeteer testing ---------------------------
#-------------------------------------------------------------------------
curl -fsSLo /tmp/chrome.zip https://storage.googleapis.com/chrome-for-testing-public/${CHROME_VERSION:?}/linux64/chrome-linux64.zip
cd /tmp
unzip chrome.zip
mv chrome-linux64 chrome
mv chrome /opt
apt install --no-install-recommends -y fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf



#-------------------------------------------------------------------------
# Installs Venom ---------------------------------------------------------
#-------------------------------------------------------------------------
curl  -fsSLo /usr/local/bin/venom https://github.com/ovh/venom/releases/download/v${VENOM_VERSION:?}/venom.linux-amd64
chmod +x     /usr/local/bin/venom



#-------------------------------------------------------------------------
# Installs ChromeDriver --------------------------------------------------
#-------------------------------------------------------------------------
curl  -fsSLo /tmp/chromedriver.zip https://storage.googleapis.com/chrome-for-testing-public/${CHROME_VERSION:?}/linux64/chromedriver-linux64.zip
cd /tmp
unzip -j chromedriver.zip
mv chromedriver /usr/local/bin




#-------------------------------------------------------------------------
# Finishing & clean up ---------------------------------------------------
#-------------------------------------------------------------------------
apt clean
apt autoremove -y
#rm -rf /var/lib/apt/lists/* /tmp/*
