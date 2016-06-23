# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils toolchain-funcs git-2

DESCRIPTION="Simple screen locker"
HOMEPAGE="https://github.com/alepez/i3lock"
SRC_URI=""
EGIT_REPO_URI="git://github.com/alepez/i3lock"
EGIT_BRANCH="master"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/pam
	dev-libs/libev
	>=x11-libs/libxkbcommon-0.5.0[X]
	x11-libs/libxcb[xkb]
	x11-libs/xcb-util
	x11-libs/cairo[xcb]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
DOCS=( CHANGELOG README.md )

pkg_setup() {
	tc-export CC
}

src_prepare() {
	sed -i -e 's:login:system-auth:' ${PN}.pam || die
	epatch_user
}

src_install() {
	default
	doman ${PN}.1
}
