#!/bin/sh

## run me : curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/install_gogo.sh | sh

set -eux 

cd /root

curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/gogo_bin/gogo --output gogo
curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/gogo_bin/web --output web

chmod +x gogo web

# register service
curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/gogo.service --output /etc/systemd/system/gogo.service


systemctl daemon-reload

systemctl enable gogo.service

systemctl start gogo

systemctl status gogo
