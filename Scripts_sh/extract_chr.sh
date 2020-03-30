#!/bin/bash

awk '{ if ($1 == 2 || $1 == 5 || $1 == 13 || $1 == 16) print $2 }' hapmap_r23a.bim > test.txt

# Extract the variants for chr 2 5 13 and 16 only.

./plink --bfile hapmap_r23a --extract test.txt --make-bed --out HapMap_3_r3_1_OK_chr