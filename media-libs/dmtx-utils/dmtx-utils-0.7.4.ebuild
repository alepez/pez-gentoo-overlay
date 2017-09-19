# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools

DESCRIPTION="Barcode data matrix reading and writing utilities"
HOMEPAGE="http://libdmtx.sourceforge.net/"
EGIT_REPO_URI="https://github.com/dmtx/dmtx-utils.git"
EGIT_COMMIT="${PVR}"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ppc ppc64 x86 ~x86-fbsd"

DEPEND="media-gfx/imagemagick media-libs/libdmtx"
RDEPEND="${DEPEND}"

src_prepare() {
    # Remove problematic LDFLAGS declaration
    sed -i -e '/^LDFLAGS/d' src/Makefile.am || die

    # Rerun autotools
    einfo "Regenerating autotools files..."
    WANT_AUTOCONF=2.5 eautoconf
    WANT_AUTOMAKE=1.9 eautomake
}
