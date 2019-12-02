#!/usr/bin/env bash

OUTDIR="data/"
if [ ! -e $OUTDIR ] ; then
    echo $OUTDIR does not exist!
fi

CUR_DIR=$(pwd)

set -eu

./download-srtm-data.sh

cd $OUTDIR

while read p; do
    ../create-tiles.sh "$p" 10 10
    rm "$p"
done < ../loaded-files.txt

cd $CUR_DIR
