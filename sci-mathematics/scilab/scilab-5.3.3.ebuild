# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Scilab 5.3.3 binary for amd64$

EAPI=4

DESCRIPTION="Scilab scientific software"
HOMEPAGE="http://www.scilab.org"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"

SRC_URI="http://www.scilab.org/download/${PV}/${P}.bin.linux-x86_64.tar.gz"

DEPEND=""
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${PN}${PV}

echo ${SRC_URI}

src_install() {

        local dest="${D}/opt/scilab"
        mkdir -p "${dest}"
        cp -R "${WORKDIR}/scilab"*/. "${dest}" || die
        dosym /opt/scilab/bin/scilab /usr/bin/scilab || die
        fowners root /opt/scilab
        fperms 777 /opt/scilab

}

pkg_postrm() {

        rm -rf "/opt/${PN}"
        rm "/usr/bin/${PN}"

}
