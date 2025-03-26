#!/bin/bash

RESULTS_FILE="ping_results.txt"

# קריאת תוצאות
readarray -t results < "$RESULTS_FILE"
unset results[0] # הסרת כותרות

# מיון תוצאות לפי השהיה
sorted_results=($(sort -t ',' -k 2 <<< "${results[*]}"))

# מציאת מהיר ואיטי ביותר
fastest=$(echo "${sorted_results[0]}" | cut -d ',' -f 1,2)
slowest=$(echo "${sorted_results[-1]}" | cut -d ',' -f 1,2)

# מציאת ממוצע
sum=0
count=0
for result in "${sorted_results[@]}"; do
    latency=$(echo "$result" | cut -d ',' -f 2)
    if [[ "$latency" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then # רק אם זה מספר
        sum=$(echo "$sum + $latency" | bc)
        count=$((count + 1))
    fi
done
average=$(echo "scale=2; $sum / $count" | bc)

# הדפסת תוצאות
echo "PINGSTORM REPORT -------------------------"
echo "Tested ${#SERVICES[@]} services"
echo "Average Latency: $average ms"
echo "✅ Fastest: $fastest"
echo "❌ Slowest: $slowest"

# הדפסת תרשים
echo "Visual:"
for result in "${sorted_results[@]}"; do
    domain=$(echo "$result" | cut -d ',' -f 1)
    latency=$(echo "$result" | cut -d ',' -f 2)
    if [[ "$latency" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        bars=$(printf "%${latency%.*}s" | tr ' ' '█')
        echo "$domain | $bars $latency ms"
    else
        echo "$domain | Timeout"
    fi
done



log_message() {
    local level="$1"
    local message="$2"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - [$level] - $message" >> "$LOG_FILE"
}



log_message "INFO" "Pinged $service. Average latency: $avg ms"
log_message "WARNING" "Ping to $service timed out"



logs)
    tail -n 10 "$LOG_FILE"
    ;;