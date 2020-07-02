# JA2 Stracciatella ModPacks

This repository hosts the script to create the modpacks package in ZIP and DEB.

## Building the package

You need `git`, `make`, `curl`, `zip`, `dpkg-deb`, and read access to GitHub.

```shell
make clean; make all
```

Alteratively run with docker:
```shell
docker build -t builder .
docker run -v $(pwd):/workdir builder
```

## Updating the mods

Edit the contents of MODS.csv. It is in the format of `$MOD_NAME,$MOD_REP,$COMMIT_OR_TAG\n`. (The trailing `\n` is required!)

Update the package version in build/DEBIAN/control.

Re-build and upload the package.

