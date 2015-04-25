#Plot4
NEI <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\Source_Classification_Code.rds")
library(plyr);library(ggplot2);library(reshape2);library(stringr)

test1<-str_detect(SCC$EI.Sector,"coal")
test2<-str_detect(SCC$EI.Sector,"Coal")
test3<-str_detect(SCC$Short.Name,"coal")
test4<-str_detect(SCC$Short.Name,"Coal")
fin<-mapply("max",test1,test2,test3,test4) #if there is one true then we get a "1" on the fin list
SCC$clist<-fin
SCClist<-SCC[clist==1,]$SCC
Nsub<-NEI[which(NEI$SCC %in% SCClist),]

ns11<-aggregate(Nsub[,4], list(Nsub$year), sum)
colnames(ns11)<-c("year","Emissions")
plot(ns11$year,ns11$Emissions)
