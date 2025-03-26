#!/bin/bash

PID=$(pgrep -f "pingstorm.sh")
LOG_FILE="pingstorm.log"

case "$1" in
    start)
        if [ -z "$PID" ]; then
            ./pingstorm.sh &
            echo "PingStorm started."
        else
            echo "PingStorm is already running."
        fi
        ;;
    stop)
        if [ -n "$PID" ]; then
            kill "$PID"
            echo "PingStorm stopped."
        else
            echo "PingStorm is not running."
        fi
        ;;
    status)
        if [ -n "$PID" ]; then
            echo "PingStorm is running. PID: $PID"
        else
            echo "PingStorm is not running."
        fi
        ;;
    logs)
        tail -n 10 "$LOG_FILE"
        ;;
    *)
        echo "Usage: $0 {start|stop|status
