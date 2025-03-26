#!/bin/bash

SERVICES=("google.com" "facebook.com" "tiktok.com" "googleusercontent.com/youtube.com/4" "netflix.com")
RESULTS_FILE="ping_results.txt"
LOG_FILE="pingstorm.log"

# פונקציה לביצוע פינג ומדידת השהיה
ping_service() {
    local service="$1"
    local sum=0
    local count=0
    for i in {1..5}; do # שולח 5 פינגים
        local time=$(ping -c 1 "$service" 2>/dev/null | grep "time=" | awk '{print $7}' | cut -d '=' -f 2 | cut -d ' ' -f 1)
        if [ -n "$time" ]; then
            sum=$(echo "$sum + $time" | bc)
            count=$((count + 1))
        fi
    done
    if [ $count -gt 0 ]; then
        local avg=$(echo "scale=2; $sum / $count" | bc)
        echo "$service,$avg" >> "$RESULTS_FILE"
        log_message "[INFO] Pinged $service. Average latency: $avg ms"
    else
        echo "$service,timeout" >> "$RESULTS_FILE"
        log_message "[WARNING] Ping to $service timed out"
    fi
}

# פונקציה לרישום הודעות
log_message() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
}

# לולאה על כל השירותים
echo "Domain,Latency (ms)" > "$RESULTS_FILE" # כותרות
for service in "${SERVICES[@]}"; do
    ping_service "$service"
done

echo "PingStorm completed."
