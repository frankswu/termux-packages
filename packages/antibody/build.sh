TERMUX_PKG_HOMEPAGE=https://github.com/getantibody/antibody
TERMUX_PKG_DESCRIPTION="The fastest shell plugin manager"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_VERSION=6.1.0
TERMUX_PKG_SRCURL=https://github.com/getantibody/antibody/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=b2cf67af801ebf10c0d52b1767cbdb5e3ab5a1713e6c3d28616a109e1d7906a7

termux_step_make() {
	termux_setup_golang

	export GOPATH=$TERMUX_PKG_BUILDDIR
	mkdir -p "$GOPATH"/src/github.com/getantibody
	ln -sf "$TERMUX_PKG_SRCDIR" "$GOPATH"/src/github.com/getantibody/antibody

	cd "$GOPATH"/src/github.com/getantibody/antibody
	go build
}

termux_step_make_install() {
	install -Dm700 \
		"$GOPATH"/src/github.com/getantibody/antibody/antibody \
		"$TERMUX_PREFIX"/bin/
}
