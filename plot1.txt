#Plot1
NEI <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\Source_Classification_Code.rds")
library(plyr);library(ggplot2);library(reshape2);library(stringr)

emeans<-aggregate(NEI[,4], list(NEI$year), sum)
barplot(emeans$x,xlab="Year",names.arg=emeans$Group.1)

