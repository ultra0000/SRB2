#
# Makefile options for unices (linux, bsd...)
#

EXENAME?=lsdl2srb2

ifndef WII
opts+=-DUNIXCOMMON -DLUA_USE_POSIX
# Use -rdynamic so a backtrace log shows function names
# instead of addresses

libs+=-lm -rdynamic


ifndef NOHW
opts+=-I/usr/X11R6/include
libs+=-L/usr/X11R6/lib
endif

endif



SDL?=1

ifdef WII
SDL=1
LINUX=0
NONX86=1
NOOPENMPT=1
NOHW=1
ECHO=1
NOGME=1
NONET=1
#NOMIXER=1
UNIX=1
SDLMAIN=1
WII=1
STATIC=1
opts+= $(MACHDEP) -I$(LIBOGC_INC)
libs+=$(MACHDEP) -L$(LIBOGC_LIB) -lm
endif


# In common usage.
ifndef WII
ifdef LINUX
libs+=-lrt
passthru_opts+=NOTERMIOS
endif
endif

# Tested by Steel, as of release 2.2.8.
ifdef FREEBSD
opts+=-I/usr/X11R6/include -DLINUX -DFREEBSD
libs+=-L/usr/X11R6/lib -lkvm -lexecinfo
endif

# FIXME: UNTESTED
#ifdef SOLARIS
#NOIPX=1
#opts+=-I/usr/local/include -I/opt/sfw/include \
#		-DSOLARIS -DINADDR_NONE=INADDR_ANY -DBSD_COMP
#libs+=-L/opt/sfw/lib -lsocket -lnsl
#endif
