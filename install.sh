#!/usr/bin/env bash
set -e

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "${INSTALL_DIR}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "${SCRIPT_DIR}/anifetch" "${INSTALL_DIR}/anifetch"
chmod +x "${INSTALL_DIR}/anifetch"

# Create afetch backwards compatibility symlink
ln -sf "${INSTALL_DIR}/anifetch" "${INSTALL_DIR}/afetch"

echo "✓ anifetch successfully installed to ${INSTALL_DIR}/anifetch"
echo "✓ Symlink created: ${INSTALL_DIR}/afetch -> anifetch"
echo "Make sure ${INSTALL_DIR} is in your PATH."
