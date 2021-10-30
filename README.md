# Table of contents
- [dyld](#dyld)
- [Why?](#why)
- [Building](#building)
- [About the patches](#about-the-patches)

## Dyld

Dyld is macOS dynamic linker, this program is in charge of looking for the proper libraries in order to load a program that was dynamically linked.

Dyld is Open Source Software, and you can find it at [Open Source Apple](https://opensource.apple.com), however Open Source does not mean easy to build, as stuff released under Open Source Apple contains references to internal macOS SDKs most of the time, this project aims to add the proper patches so it builds under a normal Developer environment.

## Why?

During 2020, after Apple announced Big Sur, one of the biggest changes as that System Dynamic Libraries were now part of the cache system, while this barely caused problems for other projects, it had huge implications for my project [EzChroot](https://github.com/DiegoMagdaleno/EzChroot), so after some research, I came across the man page for dyld_shared_cache_util, a tool which allowed the user to dump the original libraries from the cache.

While the trick mentioned above didn't work, as Apple did other changes to the way chroot works, it did provide some insight in dumping stuff from the cache.

## Building

While this is old, and is probably not the latest DYLD, I am pretty sure it might still run.

*Fair warning: This is old software and untested on other Macs, run at your discretion, I am not responsible for any damage done to your computer*

1. You will need to have a full version of Xcode installed.
2. git clone this repository. `git clone https://github.com/DiegoMagdaleno/dyld`
3. Run `make` and `make install`
4. Test the utility by running `dyld_shared_cache_util`

## About the patches

Most of the patches aren't special at all, aside from modifying the Xcode project to use the normal macOS SDK, some code was commented as it was missing symbols that I guess might be shipped on the internal SDK. The `git log` offers some insight on what changes were made.
