#!/bin/bash
set -e

DEPLOY_DIR="/var/www/backend"
APP_START="${DEPLOY_DIR}/app.js"  # change if your file is server.js or index.js
APP_NAME="ecommerce-backend"

cd $DEPLOY_DIR

if ! command -v pm2 >/dev/null 2>&1; then
  echo "Installing pm2 globally..."
  npm install -g pm2
fi

if pm2 list | grep -q $APP_NAME; then
  echo "Reloading backend with pm2..."
  pm2 reload $APP_NAME || pm2 restart $APP_NAME
else
  echo "Starting backend with pm2..."
  pm2 start $APP_START --name $APP_NAME --env production
fi

pm2 save
pm2 startup systemd -u ubuntu --hp /home/ubuntu || true

echo "Backend start completed."
