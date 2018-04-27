library("biomaRt")
ensembl <- useMart("ensembl", dataset="hsapiens_gene_ensembl")
dbsnp <- useMart("snp", dataset = "hsapiens_snp")

snps <- getBM(c('refsnp_id','allele','chrom_start','chrom_strand',
                'consequence_type_tv'), 
                filters = c('chr_name','chrom_start', 'chrom_end'), 
                mart = ensembl)
