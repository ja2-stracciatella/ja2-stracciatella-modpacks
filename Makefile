SHELL:=/bin/bash
PKG_VERSION=DEVBUILD
SHELL:=/bin/bash
all:
	PKG_VERSION=$(PKG_VERSION) ./build.sh

clean:
	rm -rf build/usr *.zip *.deb