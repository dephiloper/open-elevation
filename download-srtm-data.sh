#!/usr/bin/env bash

set -eu

for i in {37..40} 
do
  for j in {1..4}
  do
    wget http://srtm.csi.cgiar.org/wp-content/uploads/files/srtm_5x5/TIFF/srtm_${i}_0${j}.zip -q --show-progress
    unzip -q -o srtm_${i}_0${j}.zip -d data/
    rm srtm_${i}_0${j}.zip
    echo "srtm_${i}_0${j}.tif" >> ./loaded-files.txt
  done
done

rm data/*.tfw data/*.hdr data/*.txt
