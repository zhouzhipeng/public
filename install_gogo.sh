#!/bin/sh

## run me : curl -sSL https://raw.githubusercontent.com/zhouzhipeng/public/main/install_gogo.sh | sh

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
Environment="MAIN_PORT=80"
Environment="HTTPS_PORT=443"
Environment="IN_DOCKER=true"
Environment="BASE_DIR=/tmp"
Environment="TROJAN_PASSWORD=123456"
Environment="AUTO_REDIRECT_TO_HTTPS=true"
Environment="WHITELIST_ROOT_DOMAINS=zhouzhipeng.com"
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
