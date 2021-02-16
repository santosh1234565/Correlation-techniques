setwd("C:/Users/santo/Documents/documents")
#correlogram tutorial : 
# http://www.sthda.com/english/wiki/visualize-correlation-matrix-using-correlogram

library(readxl)
library(corrplot)
library(ggplot2)

CC <- read_excel(file.choose(), "for_cor") [-1]

cc = cor(CC, method = "spearman")
corrplot(cc)

corrplot(cc, tl.col = "black", order = "hclust", hclust.method = "average", addrect = 4, tl.cex = 0.7)

#saving
png(filename = "corrplot.png", width = 4, height = 4, units = "in", res = 600)
corrplot(cc, tl.col = "black", order = "hclust", hclust.method = "average", addrect = 4, tl.cex = 0.7)
dev.off()


#correlogram
library(RColorBrewer)
M <-cor(cc)
corrplot(M, type="upper", order="hclust", tl.col = "black", tl.srt = 45,
         col=brewer.pal(n=8, name="RdYlBu"))


png(filename = "corrplot1.png", width = 4.5, height = 4, units = "in", res = 600)
corrplot(M, type="upper", order="hclust",diag = FALSE,
                  hclust.method = "average", addrect = 4, tl.col ="black",tl.srt = 45, tl.cex = 0.7)
dev.off()


col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
png(filename = "corrplot2.png", width = 7, height = 7, units = "in", res = 600)
corrplot(M, method="color", col=col(200),  
         type="upper", order="hclust", 
         addCoef.col = "black", number.cex=0.7, # Add coefficient of correlation
         tl.col="black", tl.srt=45, #Text label color and rotation
         
         # hide correlation coefficient on the principal diagonal
         diag=FALSE)
dev.off()

#Scatterplots
library("PerformanceAnalytics")
chart.Correlation(cc, histogram=TRUE, pch=19)
