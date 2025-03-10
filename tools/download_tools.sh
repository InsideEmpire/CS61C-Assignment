#!/bin/bash
set -euo pipefail

PROGRAM="${1:-all}"
SEMESTER=sp25

if [[ "$PROGRAM" != "all" ]]; then
  if ! [[ "$PROGRAM" =~ ^(logisim|venus)$ ]]; then
    echo "Usage: bash $(basename "$0") <all|logisim|venus>"
    exit 1
  fi
fi

# cd into this dir
cd $(dirname "$0")

if [[ "$PROGRAM" == "all" || "$PROGRAM" == "logisim" ]]; then
  echo "Downloading Logisim..."
  logisim_time_cond_flag=""
  [[ -f logisim-evolution.jar ]] && logisim_time_cond_flag="-z logisim-evolution.jar"
  curl $logisim_time_cond_flag -L "https://inst.eecs.berkeley.edu/~cs61c/$SEMESTER/tools/logisim-evolution-latest.jar" -o logisim-evolution.jar
  echo "Downloaded Logisim!"
fi

if [[ "$PROGRAM" == "all" || "$PROGRAM" == "venus" ]]; then
  echo "Downloading Venus..."
  venus_time_cond_flag=""
  [[ -f venus.jar ]] && venus_time_cond_flag="-z venus.jar"
  curl $venus_time_cond_flag -L "https://inst.eecs.berkeley.edu/~cs61c/$SEMESTER/tools/venus-latest.jar" -o venus.jar
  echo "Downloaded Venus!"
fi
