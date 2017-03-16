BREWDIR="$TMPDIR/homebrew"
BREW="$BREWDIR/bin/brew"
rm -Rf "$BREWDIR"
mkdir -p $BREWDIR
echo "Auto-brewing $PKG_BREW_NAME in $BREWDIR..."
curl -fsSL https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $BREWDIR
$BREW tap homebrew/versions 2>&1 | perl -pe 's/Warning/Note/gi'
HOMEBREW_CACHE="$TMPDIR" $BREW install $PKG_BREW_NAME --force-bottle 2>&1 | perl -pe 's/Warning/Note/gi'
rm -f $BREWDIR/opt/$PKG_BREW_NAME/lib/*.dylib
PKG_LIBS="$PKG_LIBS_STATIC"