# Project Description

A brief description of what this repository is for and what it contains

# Contributors

Teresa Rice - tpillars@bu.edu
Maha Naim - mnaim21@bu.edu
Arushi Shrivastava - arushi08@bu.edu

# Repository Contents
Provide a brief description of each script/code file in this repo, what it does, and how to execute it

### r_commands.R
R script reads in raw Affymetrix UI33 Plus 2.0 chip data, normalizes array data together, performs RLE and NUSE as quality control measures all using functions from the R package affy. Plots from these QC tests can be exported from RStudio. Batch effects corrected for with ComBat and exported as a csv. Principal component analysis performed with prcomp(), resulting data is used to plot PC1 vs PC2. BiocManager used in order to assure all Bioconductor packages will work together. Other required packages include :"affy", "affyPLM", "sva", "AnnotationDbi", "hgu133plus2.db", "tidyverse", and "ggplot2".
