#!/usr/bin/env bash
set -e

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "${INSTALL_DIR}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "${SCRIPT_DIR}/afetch" "${INSTALL_DIR}/afetch"
chmod +x "${INSTALL_DIR}/afetch"

echo "✓ afetch successfully installed to ${INSTALL_DIR}/afetch"
echo "Make sure ${INSTALL_DIR} is in your PATH."
