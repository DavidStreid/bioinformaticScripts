bowtie2-build chr19.fa chr19_idx
mv chr19.fa chr19_idx.fa

tophat2 -r 110 -o chr19_tophat2 chr19_idx brain_1.fastqsanger brain_2.fastqsanger
tophat2 -r 110 -o chr19_tophat2_adrenal chr19_idx adrenal_1.fastq.fastqsanger adrenal_2.fastq.fastqsanger

cufflinks -g hg19_chr19.gtf chr19_tophat2/accepted_hits.bam
cufflinks -g hg19_chr19.gtf chr19_tophat2_adrenal/accepted_hits.bam

mv transcripts.gtf brainChr19_transcripts.gtf
mv transcripts.gtf adrenalChr19_transcripts.gtf

vi assemblies.txt
brainChr19_transcripts.gtf
adrenalChr19_transcripts.gtf

export PATH=/opt/cufflinks:$PATH
source ~/.bashrc

cuffmerge -o merged -s chr19_idx.fa -g hg19_chr19.gtf assemblies.txt

cuffdiff -o diff --labels brainChr19,adrenalChr19 merged/merged.gtf chr19_tophat2/accepted_hits.bam chr19_tophat2_adrenal/accepted_hits.bam
