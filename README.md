# RNA-seq Steps

• Read quality of all the FASTQ files was assessed using FastQC.

• Reads were trimmed using Cutadapt.

• Quality of surviving reads were assessed again using FastQC.

• Results of read quality were summarized using MultiQC.

• High-quality reads were pseudoaligned to the whole human transcriptome (ver. GRCh38.p7) and abundance was quantified using Kallisto.

• Principal component analysis was performed using the R package factoextra.

• Heatmap analysis was performed using the R package pheatmap.

• Differential gene expression analysis was performed using the R/Bioconductor package DESeq.

• Gene set enrichment analysis and overrepresentation analysis were performed using the R/Bioconductor package HTSanalyzeR2.

• Subnetwork analysis was performed using the R/Bioconductor HTSanalyzeR2
