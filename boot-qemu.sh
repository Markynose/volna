#!/bin/sh
# Boot Volna Linux in QEMU.
# Serial console is wired to stdio — type Ctrl-A X to exit QEMU.
set -e

VOLNA_ROOT="$(cd "$(dirname "$0")" && pwd)"
DISK="$VOLNA_ROOT/volna.img"

[ -f "$DISK" ] || { echo "No disk image at $DISK — run pkghost/disk-image.sh first."; exit 1; }

echo "==> Booting Volna Linux..."
echo "    Serial console on stdio. Ctrl-A X to quit QEMU."
echo ""

exec qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -m 512M \
  -smp 2 \
  -drive file="$DISK",format=raw,if=virtio \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -nographic \
  -no-reboot
