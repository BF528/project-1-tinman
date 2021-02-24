#install packages
install.packages("BiocManager")
BiocManager::install("affy")
BiocManager::install("affyPLM")
BiocManager::install("sva")
BiocManager::install("AnnotationDbi")
BiocManager::install("hgu133plus2.db")

#load packages
library(tidyverse)
library(ggplot2)
library(affy)
library(affyPLM)
library(sva)
library(AnnotationDbi)
library(hgu133plus2.db)

#import annotation file
ann_file <- read_csv("/project/bf528/project_1/doc/proj_metadata.csv")

#set wd to samples location
setwd("/projectnb2/bf528/users/Tinman/Project_1/sample")

#read in CEL files, and normalize
affydata <- ReadAffy()
affyrma <- rma(affydata)

#get median rle and nuse scores
affyplm <- fitPLM(affydata, normalize=TRUE, background=TRUE)
rlestats <- RLE(affyplm, type="stats")
nusestats <- NUSE(affyplm, type="stats")

#RLE matrix to dataframe and plot histogram
df_rle <- as.data.frame(t(rlestats))
plot_rle <- ggplot(df_rle, aes(x=median)) +
                     geom_histogram(color="white", fill="navy blue",bins = 35)+
  labs(title="Median RLE Scores",
       x="RLE Score", 
       y = "Count")+
  theme(plot.title=element_text(size=18, hjust=0.5, face="bold", colour="black", vjust=-1))
plot_rle

#NUSE matrix to dataframe and plot histogram
df_nuse <- as.data.frame(t(nusestats))
plot_nuse <- ggplot(df_nuse, aes(x=median)) +
  geom_histogram(color="black", fill="maroon", bins=35)+
  labs(title="Median NUSE Scores",
       x="NUSE Score", 
       y = "Count")+
  theme(plot.title=element_text(size=18, hjust=0.5, face="bold", colour="black", vjust=-1))
plot_nuse

#correct for batch effects
batch1 <- ann_file$normalizationcombatbatch
mod_a <- ann_file$normalizationcombatmod
mod1 <- model.matrix(~as.factor(mod_a))
edata <- Biobase::exprs(affyrma)
combat1 <- ComBat(dat=edata, batch=batch1, mod=mod1)

#expression data to csv
write.csv(combat1,file="/projectnb2/bf528/users/Tinman/Project_1/expression_data.csv")


#perform principal component analysis
affyrma_e <- Biobase::exprs(affyrma)
affyrma_et <- t(Biobase::exprs(affyrma))
data_scale <- scale(affyrma_et)
data_scale_t <- t(data_scale)
pca <- prcomp(data_scale_t, scale. = FALSE, center = FALSE)
pca_vals <- as.data.frame(pca$rotation)
pca_variability <- pca_vals$importance

#plot pc1  vs pc2
plot_pc1pc2 <- ggplot(pca_vals) +
  geom_point(aes(x=PC1, y=PC2, alpha = 0.5), size=3) +
  labs(
    title = "PC1 vs PC2",
    x="PC1 (percent variability=14.52%)",
    y="PC2 (percent variability=9.54%)")+
  theme(plot.title=element_text(size=25, hjust=0.5, face="bold", colour="black", vjust=-1))+
  theme(plot.subtitle=element_text(size=12, hjust=0.5, vjust = -1, face="italic", color="dark grey"))+ 
  theme(legend.position = "none")+ 
  theme(panel.background = element_rect(fill = "white"))+ 
  theme(panel.grid.major = element_line(colour = "grey"))
plot_pc1pc2
#summary
summary(pca)



