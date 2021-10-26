#!/bin/bash
# build-psp.sh by fjtrujy

## Determine the maximum number of processes that Make can work with.
PROC_NR=$(getconf _NPROCESSORS_ONLN)

TARGET="psp"
TARG_XTRA_OPTS=""

# Configure the build.
./autogen.sh
./configure \
    --quiet \
    --prefix="$PSPDEV" \
    --target="$TARGET" \
    --program-prefix="$TARGET-" \
    $TARG_XTRA_OPTS || { exit 1; }

## Compile and install.
make --quiet -j $PROC_NR clean || { exit 1; }
make --quiet -j $PROC_NR || { exit 1; }
make --quiet -j $PROC_NR install-strip || { exit 1; }
make --quiet -j $PROC_NR clean || { exit 1; }
