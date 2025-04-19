# randommac

Randomizes your Wi-Fi MAC address on macOS.

## Features

- **Auto-detects** your Wi-Fi interface (or specify manually).
- **Generates a valid, locally administered, unicast MAC address**.
- **Disconnects** your Wi-Fi before changing the MAC.
- **Clear user feedback** and error messages.
- **Checks for required tools** before running.
- **Safe for client use** (does not generate multicast or globally administered addresses).

## Usage

```sh
./randommac.sh [interface]
```

- If `[interface]` is omitted, the script auto-detects your Wi-Fi interface (usually `en0`).
- You will be prompted for your password (for `sudo`).

### Example

```sh
./randommac.sh
```

or, to specify the interface:

```sh
./randommac.sh en0
```

## Recommendations & Best Practices

- **Reconnect:**  
  After running the script, you must manually reconnect to your Wi-Fi network.
- **Permissions:**  
  The script requires `sudo` to change your MAC address and disconnect Wi-Fi.
- **Compatibility:**  
  Only tested on macOS 12 and later. Not intended for use on other operating systems.
- **Security:**  
  The generated MAC address is always locally administered and unicast, which is appropriate for client devices.
- **Tool Requirements:**  
  Requires `openssl`, `awk`, `networksetup`, and `sudo` to be available in your environment.
- **Responsibility:**  
  Use this script responsibly and only on networks where you have permission to do so.

## See Also

- [CHANGELOG.md](./CHANGELOG.md) for version history and detailed changes.

## Disclaimer

Use at your own risk. This script is provided as-is.
