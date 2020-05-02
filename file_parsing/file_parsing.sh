#!/bin/bash
# Translates input FASTA files

FASTA_DIR=$1
READING_FRAMES=reading_frame_output.txt
OUTPUT=out

mkdir -p $OUTPUT

for FASTA in ${FASTA_DIR}/*.fa; do
   SAMPLE=$(basename $FASTA | cut -d. -f1)
   echo "Processing $SAMPLE"
   TRANSLATED_FASTA=${OUTPUT}/${SAMPLE}_translated.fa
   NUCLEOTIDE_SEQ=$(tail -1 $FASTA)
   curl -s -d "dna_sequence=${NUCLEOTIDE_SEQ}&output_format=fasta" https://web.expasy.org/cgi-bin/translate/dna2aa.cgi  > $READING_FRAMES
   grep -A 1000 "5'3' Frame 1" $READING_FRAMES >$TRANSLATED_FASTA
done;


