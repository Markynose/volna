# volna linux

minimal, tty-only linux distro. musl libc, runit init, oksh shell, uutils-coreutils, apk package management.

## layout

- `rootfs/` — base system files
- `build/` — disk image and rootfs bootstrap scripts
- `pkghost/` — package repo submodule ([volna-packages](https://github.com/Markynose/volna-packages))

## boot

```
bash build/build-in-docker.sh   # optional: rebuild rootfs
bash build/disk-image.sh        # create disk image
sudo bash build/fix-grub.sh     # install grub
bash boot-qemu.sh               # boot in qemu (serial console, ctrl-a x to exit)
```

default login: `root` / `volna`
