#Plot6
NEI <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\Source_Classification_Code.rds")
library(plyr);library(ggplot2);library(reshape2);library(stringr)

fips<-c("06037", "24510")
BCLA1<-NEI[NEI$fips %in% fips,]
#grep to motor vehicle sources
SCC$vehlist<-str_detect(SCC$EI.Sector,"Vehicles")
SCCvlist<-SCC[SCC$vehlist==TRUE,1]
BCLAsub1<-BCLA1[which(BCLA1$SCC %in% SCCvlist),]

emeans<-aggregate(BCLAsub1[,4], list(BCLAsub1$year,BCLAsub1$fips), sum)
emeans
colnames(emeans)<-c("year","fips","Emissions")

qplot(year, Emissions,data=emeans,facets=.~fips) #var on left and right sides, left=rows, right=columns, (. if none) 
