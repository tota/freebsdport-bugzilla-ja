# New ports collection makefile for:	ja-bugzilla
# Date created:		2004-01-19
# Whom:			TAKATSU Tomonari <tota@rtfm.jp>
#
# $FreeBSD: ports/japanese/bugzilla/Makefile,v 1.15 2010/07/06 13:38:28 tota Exp $
#

PORTNAME=	bugzilla
PORTVERSION=	3.6.2
CATEGORIES=	japanese
MASTER_SITES=	http://bug-ja.org/releases/3.6/ \
		${MASTER_SITE_LOCAL:S|%SUBDIR%|tota/bugzilla-ja|}
PKGNAMESUFFIX=	-ja
DISTNAME=	Bugzilla-ja-${PORTVERSION}-template-rel01

MAINTAINER=	tota@FreeBSD.org
COMMENT=	Japanese localization for Bugzilla

RUN_DEPENDS=	bugzilla>=${PORTVERSION}:${PORTSDIR}/devel/bugzilla

USE_BZIP2=	yes

CONFLICTS=	bugzilla-2.*

PORTSCOUT=	limitw:1,even

.if !defined(BUGZILLADIR)
.if defined(APACHE_DATADIR)
BUGZILLADIR=	${APACHE_DATADIR}/data/bugzilla
.else
BUGZILLADIR=	${PREFIX}/www/data/bugzilla
.endif
.endif

PLIST_SUB+=	BUGZILLADIR=${BUGZILLADIR:S!^${PREFIX}/!!}

NO_BUILD=	yes
TEMPLATEDIR=	${BUGZILLADIR}/template/ja

do-install:
	-${MKDIR} ${TEMPLATEDIR}
	cd ${WRKDIR}/ja-${PORTVERSION}; ${COPYTREE_SHARE} . ${TEMPLATEDIR}
.if !defined(BATCH)
	@${ECHO_MSG}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_MSG}
.endif

.include <bsd.port.mk>
