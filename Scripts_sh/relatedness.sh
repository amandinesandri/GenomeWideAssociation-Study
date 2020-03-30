#!/bin/bash


for i in 2 5 13 16
do

# To remove all relatedness from each chromosome data.

###################################################################
./plink --bfile step_heterozygosity_chr$i --extract step_pruning_chr$i.prune.in --genome --min 0.2 --make-bed --out relatedness_step_chr$i


done 