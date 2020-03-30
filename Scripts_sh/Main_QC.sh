#!/bin/bash

#I define all the variables useful to run the script
PLINK= /home/amandine/Documents/BIM-BMC/GNOM/SOFTWARES/PLINK/plink-1.07-i686/plink
DATA_PATH= /home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam
DATA= /home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/chr
#chr2= DATA_PATH/chr2
#chr5= DATA_PATH/chr5
#chr13= DATA_PATH/chr13
#chr16=DATA_PATH/chr16


###MISSINGNESS HWE MAF
#check of the missing data per individuals and per SNP 

#for i in 2, 3, 13, 16
#do
${PLINK} --bfile ${DATA_PATH}/chr --missing --out check_missingness_for_chr
#done 

### MISSINGNESS
# Plot missingness distrib
Rscript distrib_missingness.R

# Remove SNPs and saples with too many data missingness, 
# Remove SNPs with genotyping rate too low .
PLINK --bfile ${DATA_PATH}/chr --geno 0.5 --make-bed --out step_ind_missing

# Remove samples with genotyping rate too low .
PLINK --bfile ${DATA_PATH}/step_ind_missing --mind 0.5 --make-bed --out step_snp_missing

### MAF
# Graph of the MAF distribution.
PLINK --bfile ${DATA_PATH}/step_snp_missing --freq --out MAF_distrib
Rscript MAF_distrib.R

# Remove SNPs with low MAF frequency.
PLINK --bfile ${DATA_PATH}/step_snp_missing --maf 0.05 --make-bed --out step_MAF_filter

####HETEROZYGOSITY


# We are going to remove the individuals with a heterozygosity rate that does not seem probable enough (it means taht the rate will deviate more than 
#3 standard deviation of the mean)
#First we need to do the test on independant SNPs (all the tests in GWAS are performed assuming independant data). For this, we will remove the SNP too higly
#correlated with following plink  commands
plink --bfile step_MAF_filter --range --indep-pairwise 50 5 0.2 --out step_pruning

plink --bfile step_MAF_filter --extract step_pruning.prune.in --het --out step_pruning_extracting
# The file from this command is the results of the filter applied on LD-blocks. All correlated SNPs hav been removed.

# Plot of the heterozygosity rate distribution (first R script) and then remove individuals for which the heterozygozyty rate is not probable (second R script)
Rscript heterozygosity_rate_distrib.R
Rscript heterozygosity_outliers_list.R

# F From the second Rscript above, we write a table in which data with too less probable heterozygozyty rate have been filtered (the indiv that have 
#a heterozygosity rate deviating more than 3 SD's from the mean).

#We remove those individuals with --remove command. But first the file muste be put at a good format for the remove command by removing quotations marks 
#and keeping the first two columns only
sed 's/"// g' less_probable_hetero_rate.txt | awk '{print$1, $2}'> less_probable_hetero_rate_indiv.txt

# Remove heterozygosity rate outliers.
plink --bfile step_MAF_filter --remove less_probable_hetero_rate_indiv.txt --make-bed --out step_heterozygosity

# RELATEDNESS.

# Exclusion of all individuals above the pihat threshold of 0.2 .
plink --bfile step_heterozygosity --extract step_pruning.prune.in --genome --min 0.2 --out step_pihat


