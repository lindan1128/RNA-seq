# download RNA-seq data
for i in `seq 872 917`
do
fastq-dump -v --split-3 --origfmt --gzip SRR6835${i} 
done

# download whole transcriptome
wget ftp://ftp.ensembl.org/pub/release-98/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz
gunzip Homo_sapiens.GRCh38.cdna.all.fa.gz

# unzip data
ls *fastq.gz|awk '{print "gunzio "$0""}' | sh

# quality control
fastqc -o ~/bioinformatics_project/fastQC/ -t 6 -f fastq *.fastq 

# cut adaptor
ls *fastq |awk '{print "/usr/bin/anaconda3_2/bin/cutadapt -u -20 -o     "$0".trimmed "$0""}' | sh

# multiqc
multiqc fastQC/

# kallisto
kallisto index Homo_sapiens.GRCh38.cdna.all.fa -i transcripts_index
ls *fastq |awk -F '_''{print "kallisto quant -i transcripts_index  -t 4 "$1"_1.fastq "$1"_2.fastq -o "$1"_transcripts_quant"}' | sh
