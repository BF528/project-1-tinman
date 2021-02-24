# Project Description

From a clinical and molecular perspective, colon cancer (CC) is a heterogeneous disease but to date no classification based on high-density transcriptome data has been established. The aim of this study was to build up a robust molecular classification of mRNA expression profiles (Affymetrix U133Plus2) of a large series of 443 CC and 19 non-tumoral colorectal mucosas, and to validate it on an independent serie of 123 CC and 906 public dataset. We identified and validated six molecular subtypes in this large cohort as a combination of multiple molecular processes that complement current disease stratification based on clinicopathological variables and molecular markers. The biological relevance of these subtypes was consolidated by significant differences in survival. These insights open new perspectives for improving prognostic models and targeted therapies.

# Contributors

Teresa Rice - tpillars@bu.edu

Maha Naim - mnaim21@bu.edu

Arushi Shrivastava - arushi08@bu.edu

# Repository Contents
Provide a brief description of each script/code file in this repo, what it does, and how to execute it

### r_commands.R
R script reads in raw Affymetrix UI33 Plus 2.0 chip data, normalizes array data together, performs RLE and NUSE as quality control measures all using functions from the R package affy. Plots from these QC tests can be exported from RStudio. Batch effects corrected for with ComBat and exported as a csv. Principal component analysis performed with prcomp(), resulting data is used to plot PC1 vs PC2. BiocManager used in order to assure all Bioconductor packages will work together. Other required packages include :"affy", "affyPLM", "sva", "AnnotationDbi", "hgu133plus2.db", "tidyverse", and "ggplot2".

### GSM- Affy Data
Among a large series of colon cancers collected for the Cartes d'Identité des Tumeurs (CIT) program from the French Ligue Nationale Contre le Cancer (http://cit.ligue-cancer.net), 598 were analyzed for mRNA expression profiles using Affymetrix U133plus2 chip and, among theses, 463 could also be analyzed for DNA alteration profiles using the CGH Array (CIT-CGHarray V6). The 585 tumors was divided into a discovery dataset of 443 CC and a validation dataset of 123 CC and 19 non-tumoral dataset.

Locate the paper’s repository on GEO (http://www.ncbi.nlm.nih.gov/geo/) by searching for accession number GSE39582. Here I have uploaded the .CEL.gz files.
