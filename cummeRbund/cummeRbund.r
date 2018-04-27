source("https://bioconductor.org/biocLite.R")
biocLite("cummeRbund")
library(cummeRbund)
cuff<-readCufflinks(dir="/PATH/TO/diff")
disp<-dispersionPlot(genes(cuff))

