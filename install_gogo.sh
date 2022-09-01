#!/bin/sh

## run me : curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/install_gogo.sh | sh

set -eux 

apt install -y unzip

cd /root

curl -sSL https://github.com/zhouzhipeng/public/releases/download/1.0/gogo_debian.zip --output gogo_debian.zip
unzip gogo_debian.zip

chmod +x gogo web

# register service
curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/gogo.service --output /etc/systemd/system/gogo.service

systemctl daemon-reload

systemctl enable gogo.service

systemctl start gogo

systemctl status gogo
