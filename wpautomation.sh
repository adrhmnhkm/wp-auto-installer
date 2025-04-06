#!/bin/bash

# === Konfigurasi ===
SITE_DIR="/var/www/umrahkit"
DB_NAME="umrahkit_db"
DB_USER="umrahkit_user"
DB_PASS="passwordku123"   # Ganti ini!
DB_HOST="localhost"

echo "🚀 Mulai install WordPress..."

# 1. Buat folder jika belum ada
sudo mkdir -p "$SITE_DIR"
cd "$SITE_DIR" || exit

# 2. Download WordPress
sudo wget -q https://wordpress.org/latest.zip
sudo unzip -q latest.zip
sudo mv wordpress/* ./
sudo rm -rf wordpress latest.zip

# 3. Set permission
sudo chown -R www-data:www-data "$SITE_DIR"
sudo find "$SITE_DIR" -type d -exec chmod 755 {} \;
sudo find "$SITE_DIR" -type f -exec chmod 644 {} \;

# 4. Buat database & user MySQL
echo "🧱 Membuat database dan user..."
sudo mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
sudo mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASS';"
sudo mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_HOST';"
sudo mysql -e "FLUSH PRIVILEGES;"

# 5. Buat file wp-config.php otomatis
echo "📝 Membuat wp-config.php..."
sudo cp wp-config-sample.php wp-config.php
sudo sed -i "s/database_name_here/$DB_NAME/" wp-config.php
sudo sed -i "s/username_here/$DB_USER/" wp-config.php
sudo sed -i "s/password_here/$DB_PASS/" wp-config.php
sudo sed -i "s/localhost/$DB_HOST/" wp-config.php

# 6. Set ulang permission setelah ubah file
sudo chown www-data:www-data wp-config.php

echo "✅ WordPress siap! Akses sekarang: http://umrahkit.kitlab.web.id"
