data<- read.table(file="/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/PartieB/MDS_merge4.mds",header=TRUE)
race<- read.table(file="/home/amandine/Documents/BIM-BMC/GNOM/bed_bim_fam/PartieB/racefile.txt",header=TRUE)
datafile<- merge(data,race,by=c("IID","FID"))
head(datafile)

pdf("MDS.pdf")
for (i in 1:nrow(datafile))
{
if (datafile[i,14]=="CEU") {plot(datafile[i,4],datafile[i,5],type="p",xlim=c(-0.06,0.6),ylim=c(-2,0.12),xlab="MDS Component 1",ylab="MDS Component 2",pch=1,cex=0.5,col="chartreuse")}
  if (datafile[i,14]=="JPT") {plot(datafile[i,4],datafile[i,5],type="p",xlim=c(-0.06,0.6),ylim=c(-2, 0.12),xlab="MDS Component 1",ylab="MDS Component 2",pch=1,cex=0.5,col="cyan")}
if (datafile[i,14]=="CHB") {plot(datafile[i,4],datafile[i,5],type="p",xlim=c(-0.06,0.6),ylim=c(-2, 0.12),xlab="MDS Component 1",ylab="MDS Component 2",pch=1,cex=0.5,col="cyan2")}
if (datafile[i,14]=="YRI") {plot(datafile[i,4],datafile[i,5],type="p",xlim=c(-0.06,0.6),ylim=c(-2, 0.12),xlab="MDS Component 1",ylab="MDS Component 2",pch=1,cex=0.5,col="gold")}
if (datafile[i,14]=="OWN") {plot(datafile[i,4],datafile[i,5],type="p",xlim=c(-0.06,0.6),ylim=c(-2, 0.12),xlab="MDS Component 1",ylab="MDS Component 2",pch=3,cex=0.7,col="black")}
}

legend("topright", pch=c(1,1,1,1,3),c("CEU","JPT","CHB", "YRI", "OWN"),col=c("chartreuse","cyan","cyan2", "gold","black" ),bty="o",cex=1)



