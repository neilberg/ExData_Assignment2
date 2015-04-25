#Plot2
NEI <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\Source_Classification_Code.rds")
library(plyr);library(ggplot2);library(reshape2);library(stringr)

BC1<-NEI[NEI$fips==24510,]
emeans<-aggregate(BC1[,4], list(BC1$year), sum)
barplot(emeans$x,xlab="Year",names.arg=emeans$Group.1)


