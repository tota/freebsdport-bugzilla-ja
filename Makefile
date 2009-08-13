# New ports collection makefile for:	bugzilla-ja
# Date created:		2009-08-03
# Whom:			TAKATSU Tomonari <tota@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	bugzilla
DISTVERSION=	3.4.1
CATEGORIES=	japanese
MASTER_SITES=	ftp://ftp.mozilla.gr.jp/Bugzilla-ja/3.4/ \
		${MASTER_SITE_LOCAL}
PKGNAMESUFFIX=	-ja
DISTNAME=	Bugzilla-ja-${DISTVERSION}-template-rel01

MAINTAINER=	tota@FreeBSD.org
COMMENT=	Japanese localization for Bugzilla

RUN_DEPENDS=	bugzilla>=3.4:${PORTSDIR}/devel/bugzilla

USE_BZIP2=	yes

CONFLICTS=	bugzilla-2.*

.if !defined(BUGZILLADIR)
.if defined(APACHE_DATADIR)
BUGZILLADIR=	${APACHE_DATADIR}/data/bugzilla
.else
BUGZILLADIR=	${PREFIX}/www/data/bugzilla
.endif
.endif

PLIST_SUB+=	BUGZILLADIR=${BUGZILLADIR:S!^${PREFIX}/!!}

NO_BUILD=	yes

do-install:
	-${MKDIR} ${BUGZILLADIR}/template
	${CP} -pR ${WRKDIR}/ja ${BUGZILLADIR}/template/
.if !defined(BATCH)
	@${ECHO_MSG}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_MSG}
.endif

.include <bsd.port.mk>
