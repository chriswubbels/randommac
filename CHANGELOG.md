# Changelog for randommac

## Version 2.0a – 2025-04-19

### Changes
- Complete rewrite for robustness and maintainability.
- Now written in `bash` for broader compatibility.
- Auto-detects Wi-Fi interface, or allows manual override.
- Generates a valid, locally administered, unicast MAC address.
- Checks for required tools before running.
- Provides clear user feedback and error messages.
- Exits on error (`set -e`).
- Improved code structure with functions and comments.

### Notes
- You must reconnect to your Wi-Fi network after running the script.
- The script is intended for macOS and uses macOS-specific tools.
- The generated MAC address is always locally administered and unicast (safe for client use).
- Only tested on macOS 12+.
- Use at your own risk.

---

## Version 1.0 - Tested on macOS 12.2.1 - 2022-03-07

Generates a random MAC address, disconnects from any Wi-Fi networks, and sets the Wi-Fi interface to use the random address.

### Notes:

- Does nothing to examine whether the MAC address is unicast, multicast, etc. YMMV
- Does not reconnect to the Wi-Fi network. You need to do that manually in the usual way. 