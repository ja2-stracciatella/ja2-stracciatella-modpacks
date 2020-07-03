#!/bin/bash

PKG_ROOT="./build"
ASSETS_ROOT="${PKG_ROOT}/usr/share/ja2/mods"
PKG_VERSION=${PKG_VERSION:-DEVBUILD}

rm -rf "${ASSETS_ROOT}/*"
mkdir -p "$ASSETS_ROOT"
while IFS="," read -r MODNAME REPO COMMIT
do
  echo "downloading $MODNAME..."
  mkdir -p "$ASSETS_ROOT/$MODNAME"
  curl -sL "$REPO/archive/$COMMIT.tar.gz" | tar xz --strip-components=1 -C "$ASSETS_ROOT/$MODNAME"
done <"MODS.csv"

echo "Version: ${PKG_VERSION}"  >  "${ASSETS_ROOT}/MODPACKS"
echo "Created: $(date -uR)"     >> "${ASSETS_ROOT}/MODPACKS"
echo "Hash: $(md5sum MODS.csv)" >> "${ASSETS_ROOT}/MODPACKS"

echo "creating deb package"
dpkg-deb --build "$PKG_ROOT" "ja2-stracciatella-modpacks_$PKG_VERSION.deb"

echo "creating zipball"
ZIPBALL="ja2-stracciatella-modpacks_$PKG_VERSION.zip"
( 
  pushd "$ASSETS_ROOT/"; zip -rq "$ZIPBALL" *
)
mv "$ASSETS_ROOT/$ZIPBALL" .
