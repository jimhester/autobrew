BREWDIR="$TMPDIR/homebrew"
BREW="$BREWDIR/bin/brew"
rm -Rf $BREWDIR
mkdir -p $BREWDIR
echo "Auto-brewing $PKG_BREW_NAME in $BREWDIR..."
curl -fsSL https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $BREWDIR
BREW_DEPS=$($BREW deps -n $PKG_BREW_NAME)
HOMEBREW_CACHE="/tmp" $BREW install --force-bottle $BREW_DEPS $PKG_BREW_NAME 2>&1 | perl -pe 's/Warning/Note/gi'
rm -f $BREWDIR/Cellar/$PKG_BREW_NAME/*/lib/*.dylib
rm -f $BREWDIR/opt/*/lib/*.dylib
