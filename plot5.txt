#Plot5
NEI <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\Source_Classification_Code.rds")
library(plyr);library(ggplot2);library(reshape2);library(stringr)

BC1<-NEI[NEI$fips==24510,]

SCC$vehlist<-str_detect(SCC$EI.Sector,"Vehicles")
SCCvlist<-SCC[SCC$vehlist==TRUE,1]
Bsub<-BC1[which(BC1$SCC %in% SCCvlist),]

Bsub1<-aggregate(Bsub[,4], list(Bsub$year), sum)
colnames(Bsub1)<-c("year","Emissions")

plot(Bsub1$year,Bsub1$Emissions)
