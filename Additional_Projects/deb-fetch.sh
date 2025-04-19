#!/bin/bash

# Check if a package name was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <package-name>"
    exit 1
fi

PKG_NAME="$1"
TARGET_DIR="${PKG_NAME}-debs"

# Create the output directory
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1

echo "[+] Fetching .deb files for: $PKG_NAME"
echo "[+] Saving to: $TARGET_DIR"

# Get list of real packages (filter out virtual ones) and download .debs
apt-rdepends "$PKG_NAME" 2>/dev/null | grep -v "^ " | while read -r pkg; do
    if apt-cache show "$pkg" > /dev/null 2>&1; then
        echo "  - Downloading $pkg..."
        apt download "$pkg" > /dev/null
    else
        echo "  - Skipping virtual package: $pkg"
    fi
done

echo "[✓] Done. All .deb files saved in: $TARGET_DIR"

