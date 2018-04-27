source("https://bioconductor.org/biocLite.R")
biocLite("cummeRbund")
library(cummeRbund)
cuff<-readCufflinks(dir="/Users/Bike_Thoughts/Documents/JHU_courses/ToolsForGenomeAnalysis/Unit14/Graded_Homework/diff")
disp<-dispersionPlot(genes(cuff))

