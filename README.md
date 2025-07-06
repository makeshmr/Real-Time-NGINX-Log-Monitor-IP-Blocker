

# 🚫 Real-Time NGINX Log Monitor & IP Blocker

[![Shell Script](https://img.shields.io/badge/Bash-Script-blue?logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![NGINX](https://img.shields.io/badge/Nginx-ReverseProxy-brightgreen?logo=nginx)](https://www.nginx.com/)
[![Apache](https://img.shields.io/badge/Apache-Backend-orange?logo=apache)](https://httpd.apache.org/)
[![Cron](https://img.shields.io/badge/Cron-Scheduler-yellow)](https://en.wikipedia.org/wiki/Cron)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

A lightweight real-time monitoring and IP blocking solution for NGINX web servers. This project automatically detects abusive clients and blocks their access dynamically, while also demonstrating load balancing between backend servers.

---

## 📽️ Demo

▶️ [Watch Demo on YouTube](https://www.youtube.com/watch?v=DPP508LrNro)

---

## 📁 Project Structure

| File/Folder             | Description |
|-------------------------|-------------|
| `block_abusive_ips.sh`  | Bash script to detect and block abusive IPs based on access frequency. |
| `blocked_ips.conf`      | Dynamically updated NGINX include file for denied IPs. |
| `nginx.conf`            | Main NGINX configuration with access logging and rate limiting. |
| `load_balancing.conf`   | NGINX configuration to proxy requests to Apache backend servers. |
| `crontab.txt`           | Contains the cron schedule for running the monitoring script. |
| `README.md`             | Project documentation. |
| `images/`               | Screenshots (optional). |
| `Abusive ip blocker.mp4`| Local copy of the demo video (optional). |

---

## 💡 Key Features

- **Real-Time Log Monitoring**: Analyzes NGINX access logs every minute.
- **Abuse Detection**: Blocks IPs with excessive requests (e.g., >8 requests/min).
- **Automated IP Blocking**: Updates NGINX configuration with `deny` rules.
- **NGINX Reload**: Applies changes immediately by reloading NGINX.
- **Load Balancer Simulation**: Proxies requests to multiple Apache backend servers.
- **Rate Limiting**: Prevents abuse via NGINX’s built-in rate limiting.

---

## ⚙️ Technologies Used

- **NGINX** for load balancing, rate limiting, and access logging.
- **Apache2** as simple backend servers to simulate a production-like environment.
- **Bash** scripting for automation.
- **Cron** for scheduled execution of the monitoring script.

---

## 🔧 Setup Overview

1. **Install Apache** on two backend servers.
2. **Install NGINX** on a separate load balancer server.
3. Configure NGINX to:
   - Include `blocked_ips.conf` dynamically.
   - Load balance traffic to backend servers.
   - Enable rate limiting.
4. Schedule the script with `cron` to check logs every minute.

---

## 📋 Usage

- Place all configuration files in the appropriate directories.
- Make the script executable and ensure it has the necessary permissions.
- Monitor logs using the script and view logs for blocked IPs.
- Use the included cron schedule to automate detection.

---

## ✅ Requirements

- Ubuntu/Debian-based Linux system
- NGINX and Apache2 installed
- Sudo privileges
- Cron service enabled

---

## 🙌 Contributing

Contributions, issues, and feature requests are welcome! Open a pull request or issue if you'd like to collaborate.

---

Happy Monitoring! 🚀
