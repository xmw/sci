# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Tablet is a lightweight, high-performance graphical viewer for next generation sequence assemblies and alignments."
HOMEPAGE="http://bioinf.scri.ac.uk/tablet/"
SRC_URI="http://bioinf.scri.ac.uk/tablet/installers/tablet_linux_x86_1_10_09_20.sh
		http://bioinf.scri.ac.uk/tablet/additional/coveragestats.py"

# Tablet uses a modified version of the BSD License which has been edited to remove references to distribution and use in source forms. This means that we are happy for you to distribute and use Tablet however you please, but we do not (yet) want to make the source code publicly available.
LICENSE="BSD-modified" # It's in the installer, and ends up on disk after installation at tablet/docs/tablet.html
					   # The original BSD licence was modified to remove references to distribution and use in
					   #source forms, because we cannot make the source code available for Tablet.
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/java"
RDEPEND="${DEPEND}"

src_install() {
	sh tablet_linux_x86_1_10_09_20.sh -c -q <<-EOF
	o
	[Enter]
	[Enter]
	[Enter]
	1
	"${D}"/opt/Tablet
	EOF
	dobin "${DISTDIR}"/coveragestats.py  | die
}
