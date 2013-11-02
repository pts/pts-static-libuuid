#! /bin/bash --
BINPREFIX='/home/pts/prg/pts-mini-gpl/uevalrun/cross-compiler/bin/i686-'
CC="${BINPREFIX}gcc -static -fno-stack-protector"
AR="${BINPREFIX}ar"
RANLIB="${BINPREFIX}ranlib"

set -ex
rm -f *.o *.a
$CC -s -Os -W -Wall \
    -DHAVE_SYS_UN_H -DHAVE_SYS_SYSCALL_H -DHAVE_NETINET_IN_H -DHAVE_NET_IF_H \
    -DHAVE_STDLIB_H -DHAVE_SYS_FILE_H -DHAVE_SYS_IOCTL_H -DHAVE_SYS_SOCKET_H \
    -DHAVE_SYS_RESOURCE_H -DHAVE_SYS_TIME_H -DHAVE_UNISTD_H \
    -D_XOPEN_SOURCE=500 -c \
    clear.c compare.c copy.c gen_uuid.c isnull.c pack.c parse.c unpack.c \
    unparse.c
$AR cr libuuid.a *.o
$RANLIB libuuid.a
: c.sh OK.
