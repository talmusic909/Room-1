
#!/bin/bash

RESULTS_FILE="ping_results.txt"
CSV_FILE="ping_results.csv"

# העתקת התוכן עם כותרות
cat "$RESULTS_FILE" > "$CSV_FILE"

echo "Results saved to $CSV_FILE"