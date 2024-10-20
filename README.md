# Mk5 Supra iDrive 6 UI assets

Part of the Mk5 Supra iDrive 6 hacking project. Retrieved via SSH from the head unit. [SSH access guide here](https://www.supramkv.com/threads/ssh-access-guide-supra-nbtevo-headunit.24190/)

A straight dump of `/net/hu-omap/fs/sda0/opt/hmi/ID5/data/ro/j29/id6l/` from the Mk5 Supra's head unit. I believe this contains all the UI assets for the iDrive 6 system. Most of the UI is made up of PNGs.

We can swap these PNGs out to change the look of the UI. I have only tested this with `/widgetasset/welcome/home.png` and it did work.

Some files are in unknown formats. Some of these formats are:

- `*.pbr` - Unknown
- `*.ptr` - Unknown
- `*.pbx` - Unknown. Maybe a 3D/2D scene description?
- `*.pbw` - Unknown. Maybe a widget?
- `*.rsvi` - Unknown. Maybe a 3D/2D model?
- `*.shd` - Unknown. Looks like an OpenGL shader?
- `*.lua` - Lua script
