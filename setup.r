library("biomaRt")  

# FIND AND LOAD DATA - useDataset/useMart
listMarts()          # List available web services
#                biomart               version
# 1 ENSEMBL_MART_ENSEMBL      Ensembl Genes 92
# 2   ENSEMBL_MART_MOUSE      Mouse strains 92
# 3     ENSEMBL_MART_SNP  Ensembl Variation 92
# 4 ENSEMBL_MART_FUNCGEN Ensembl Regulation 92

# Connect to ensembl database
ensembl <- useMart("ENSEMBL_MART_SNP")

listDatasets(ensembl)
#             description           version
# 1          mgallopavo_snp               Turkey Short Variants (SNPs and indels excluding flagged variants) (Turkey_2.01)       Turkey_2.01
# ...
# 15           hsapiens_snp                 Human Short Variants (SNPs and indels excluding flagged variants) (GRCh38.p12)        GRCh38.p12
# ...
# 33            sscrofa_snp                  Pig Short Variants (SNPs and indels excluding flagged variants) (Sscrofa11.1)       Sscrofa11.1
# 34        rnorvegicus_snp                     Rat Short Variants (SNPs and indels excluding flagged variants) (Rnor_6.0)          Rnor_6.0

snp_ensembl <- useDataset("hsapiens_snp",mart=ensembl)
# Specify immediately dataset if known
# snp_ensembl <- useMart("ensembl", dataset = "hsapiens_snp")

# QUERY BUILDING - getBM
# 1) filters 2) attributres 3) values 4) mart
filters <- listFilters(snp_ensembl)
attributes <- listAttributes(snp_ensembl)
# Alphabetical
# filters[order(filters$name),]
# attributes[order(attriburtes$name),]

query_attributes <- c("refsnp_id", "refsnp_source", "chr_name", "chrom_start", "chrom_end", "translation_start", "translation_end", "consequence_type_tv", "sift_prediction", "polyphen_prediction")
query_filters <- c("phenotype_source")
query <- c("Clinvar")

getBM(attributes = query_attributes, filters = query_filters, values = query, mart = snp_ensembl)
