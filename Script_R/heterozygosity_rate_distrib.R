
het_chr2 <- read.table("/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/step_pruning_extracting_chr2.het", head=TRUE)
pdf("/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/heterozygosity_chr2.pdf")
het_chr2$HET_RATE = (het_chr2$"N.NM." - het_chr2$"O.HOM.")/het_chr2$"N.NM."
hist(het_chr2$HET_RATE, xlab="Heterozygosity Rate", ylab="Frequency", main= "Distribution of Heterozygosity for chr 2")
dev.off()

het_chr5 <- read.table("/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/step_pruning_extracting_chr5.het", head=TRUE)
pdf("/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/heterozygosity_chr5.pdf")
het_chr5$HET_RATE = (het_chr5$"N.NM." - het_chr5$"O.HOM.")/het_chr5$"N.NM."
hist(het_chr5$HET_RATE, xlab="Heterozygosity Rate", ylab="Frequency", main= "Distribution of Heterozygosity for chr 5")
dev.off()

het_chr13 <- read.table("/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/step_pruning_extracting_chr13.het", head=TRUE)
pdf("/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/heterozygosity_chr13.pdf")
het_chr13$HET_RATE = (het_chr13$"N.NM." - het_chr13$"O.HOM.")/het_chr13$"N.NM."
hist(het_chr13$HET_RATE, xlab="Heterozygosity Rate", ylab="Frequency", main= "Distribution of Heterozygosity for chr 13")
dev.off()

het_chr16 <- read.table("/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/step_pruning_extracting_chr16.het", head=TRUE)
pdf("/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/heterozygosity_chr16.pdf")
het_chr16$HET_RATE = (het_chr16$"N.NM." - het_chr16$"O.HOM.")/het_chr16$"N.NM."
hist(het_chr16$HET_RATE, xlab="Heterozygosity Rate", ylab="Frequency", main= "Distribution of Heterozygosity for chr 16")
dev.off()

