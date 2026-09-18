#!/usr/bin/env bash
set -e

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "${INSTALL_DIR}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "${SCRIPT_DIR}/ikifetch" "${INSTALL_DIR}/ikifetch"
chmod +x "${INSTALL_DIR}/ikifetch"

# Create afetch & anifetch backwards compatibility symlinks
ln -sf "${INSTALL_DIR}/ikifetch" "${INSTALL_DIR}/afetch"
ln -sf "${INSTALL_DIR}/ikifetch" "${INSTALL_DIR}/anifetch"

echo "✓ ikifetch successfully installed to ${INSTALL_DIR}/ikifetch"
echo "✓ Symlinks created: afetch -> ikifetch, anifetch -> ikifetch"
echo "Make sure ${INSTALL_DIR} is in your PATH."
