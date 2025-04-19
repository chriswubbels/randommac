#!/bin/bash

# randommac.sh - Randomize your Wi-Fi MAC address on macOS
# Version 2.0a - 2025-04-19

set -e

# --- Functions ---

usage() {
  echo "Usage: $0 [interface]"
  echo "Randomizes the MAC address of your Wi-Fi interface (default: auto-detect)."
  exit 1
}

require_tool() {
  command -v "$1" >/dev/null 2>&1 || { echo "Error: '$1' is required but not installed."; exit 1; }
}

find_wifi_interface() {
  networksetup -listallhardwareports | \
    awk '/Wi-Fi|AirPort/{getline; print $2; exit}'
}

generate_mac() {
  # Generate 6 random bytes
  local bytes
  bytes=($(openssl rand -hex 6 | sed 's/\(..\)/\1 /g'))
  # Set locally administered (bit 1) and unicast (bit 0) in first byte
  local first_byte=$(( 0x${bytes[0]} ))
  first_byte=$(( (first_byte | 0x02) & 0xFE ))
  printf "%02x:%s:%s:%s:%s:%s\n" "$first_byte" "${bytes[1]}" "${bytes[2]}" "${bytes[3]}" "${bytes[4]}" "${bytes[5]}"
}

# --- Main ---

# Check for required tools
require_tool openssl
require_tool networksetup
require_tool awk
require_tool sudo

# Get interface (from arg or auto-detect)
INTERFACE="${1:-$(find_wifi_interface)}"
if [[ -z "$INTERFACE" ]]; then
  echo "Error: Could not detect Wi-Fi interface. Please specify as argument."
  usage
fi

# Generate MAC
MAC=$(generate_mac)

echo "Wi-Fi interface: $INTERFACE"
echo "Generated MAC:   $MAC"

# Disconnect Wi-Fi
echo "Disconnecting Wi-Fi..."
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport "$INTERFACE" -z

# Set new MAC
echo "Setting new MAC address..."
sudo ifconfig "$INTERFACE" ether "$MAC"

echo "Done. You may need to reconnect to your Wi-Fi network."