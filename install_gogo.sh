#!/bin/bash

## run me : curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/install_gogo.sh | bash

set -eux 

cd /root

curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/gogo_bin/gogo --output gogo
curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/gogo_bin/web --output web

chmod +x gogo web

# register service
cat > /etc/systemd/system/gogo.service  << EOF
[Unit]
Description=GoGo Service
After=network.target

[Service]
Type=simple
Restart=always
ExecStart=/root/gogo

[Install]
WantedBy=multi-user.target

EOF

systemctl daemon-reload

systemctl enable gogo.service

systemctl start gogo

systemctl status gogo
