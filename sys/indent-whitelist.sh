#!/bin/sh
FILES="
libr/util/base64.c
libr/util/name.c
libr/util/idpool.c
libr/util/stack.c
libr/util/slist.c
libr/util/log.c
libr/util/cache.c
libr/util/print.c

libr/asm/p/asm_bf.c

libr/hash/calc.c
libr/hash/crc16.c
libr/hash/luhn.c
libr/hash/xxhash.c
libr/hash/md4.c
libr/hash/adler32.c
libr/hash/hash.c
libr/hash/sha2.c

libr/reg/reg.c
libr/reg/arena.c
libr/reg/double.c
libr/reg/cond.c
libr/reg/value.c
libr/reg/profile.c

libr/include/r_list.h
libr/include/r_reg.h
libr/include/r_util.h

libr/anal/cycles.c
libr/anal/esil.c
libr/anal/data.c
libr/anal/p/anal_arc.c

libr/config/config.c
libr/config/callback.c
libr/config/t/test.c

libr/fs/fs.c
libr/fs/file.c

libr/bin/bin.c
libr/bin/bin_write.c
libr/bin/dbginfo.c
libr/bin/filter.c
libr/bin/format/objc/mach0_classes.c

libr/cons/hud.c
libr/cons/2048.c
libr/cons/utf8.c
libr/cons/line.c
libr/cons/canvas.c
libr/cons/editor.c

libr/core/file.c
libr/core/yank.c
libr/core/blaze.c

binr/radare2/radare2.c
binr/rabin2/rabin2.c
binr/rasm2/rasm2.c
binr/rax2/rax2.c
"
case "$1" in
"help"|-h)
	echo "Usage. sys/indent-whitelist.sh [commit] [apply]"
	;;
"commit")
	sys/indent.sh -i ${FILES}
	git commit sys/indent* ${FILES}
	;;
"apply")
	sys/indent.sh -i ${FILES}
	;;
*)
	sys/indent.sh -u ${FILES}
esac
