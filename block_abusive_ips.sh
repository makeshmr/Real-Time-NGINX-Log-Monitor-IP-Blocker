#!/bin/bash
#

# === Configuration Files ===
LOG_FILE="/var/log/nginx/access.log"
BLOCKED_IPS="/etc/nginx/blocked_ips.conf"

# === Get Recent IPs (within last 1 minute) ===
get_recent_ips() {
	local time	
	time=$(date --date="1 minute ago" "+%d/%b/%Y:%H:%M:%S")
	
	awk -v min_time="$time"	'{
		timestamp=substr($4,2)
		if (timestamp > min_time) {
			print $1

		}
	}' "$LOG_FILE"
}


# === Get IPs with >8 requests in last minute ===
get_offending_ips() {
	 echo "$RECENT_IPS" | sort | uniq -c | awk '$1 > 8 {print $2}'
}


# === Run Analysis ===
RECENT_IPS=$(get_recent_ips)
ABUSIVE_IPS=$(get_offending_ips)


# === Block Abusive IPs ===
for ip in $ABUSIVE_IPS; do
	if ! grep -q "$ip" $BLOCKED_IPS; then
		echo "deny $ip;" | sudo tee -a /etc/nginx/blocked_ips.conf > /dev/null
		echo "Blocked the following IP: $ip"

	fi
done

# === Reload NGINX to Apply New Rules ===
sudo systemctl reload nginx
