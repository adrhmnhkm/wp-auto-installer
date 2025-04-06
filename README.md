# 🛠️ WP Auto Installer

A simple bash script to automatically install WordPress on a NGINX server (tested on NAT VPS setup).  
This script creates a new MySQL database, downloads WordPress, sets up the configuration file, and prepares your web root directory.

## 🚀 Features

- Auto download latest WordPress
- Auto setup database (with user + password)
- Auto create `wp-config.php`
- Ready to serve with NGINX
- Perfect for NAT VPS + Cloudflare

## 📦 Requirements

- NGINX installed
- PHP (7.4 or higher) with `php-fpm`
- MySQL server
- `wget`, `unzip`, `curl`, `jq`, etc.
- Basic Cloudflare & NAT forwarding config

## 🧪 How to Use

```bash
chmod +x install-wp.sh
./install-wp.sh

Follow the prompts:

Enter the site name (used as folder name)

Enter DB name, DB user, DB password

Once done, you can access the site from your browser and finish the WP setup via web installer.

💡 Notes
Make sure NGINX virtual host (server block) is already configured

Don’t forget to secure your database and remove the script after install

Compatible with NAT VPS (port forwarding setup required)

🐙 GitHub
Feel free to fork or contribute!