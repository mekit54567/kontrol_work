#!/bin/bash
# Пример скрипта для сканирования целевой машины в диапазоне портов и сохранения результатов
if [ -z "$1" ]; then
  echo "Usage: $0 <TARGET_IP>"
  exit 1
fi
TARGET=$1
OUTDIR="$(dirname "$0")/../results"
mkdir -p "$OUTDIR"
nmap -sS -Pn -p- $TARGET -oN "$OUTDIR/nmap_full_tcp.txt"
nmap -sV -sC -p22,21,23,80,139,445,3306 $TARGET -oN "$OUTDIR/nmap_services.txt"
sudo nmap -sU -p- $TARGET -oN "$OUTDIR/nmap_udp.txt"
echo "Scans saved to $OUTDIR"
