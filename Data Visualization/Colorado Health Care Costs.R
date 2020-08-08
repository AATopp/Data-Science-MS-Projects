#Alla Topp
#Assignemt 7
#Colorado Health Care Costs 

library(tidyverse)
library(data.table)
library(ggrepel)
library(readxl)
library(scales)
library(ggplot2)

#setwd("D:/Users/aleks/Desktop/Regis/MSDS670 Data Visualization/Week 7")
#df <- read_xlsx('Week_7_Homework_Data.xlsx', sheet = 'Colorado Health Care Costs')
#colnames(df) <- as.character(unlist(df[1,]))
#df = df[-1, ]
#df <- data.table(df)
#str(df)

year <- rep(c("2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"))


epop <- c(8428, 8846, 9112, 10525, 10909, 11234, 11735, 11503, 12456, 13180)
fp <- c(11952, 13360, 13393, 14580, 16037, 16636, 15932, 16940, 17459, 19396)
sp <- c(4303, 4570, 4630, 5212, 5212, 5668, 5848, 5794, 5792, 6456)

values <- c(sp, epop, fp)
type <- c(rep("Single Premium", 10),rep("Employee Plus One", 10), rep("Family Premium", 10))
mydata <- data.frame(year, values)

ggplot(mydata, aes(year, values)) + geom_bar(stat = "identity", aes(fill = type), position = "dodge") + 
  
       theme_classic() +
  
       theme(axis.title.x=element_blank(), axis.title.y=element_blank(),
             legend.position = "bottom", plot.title = element_text(hjust = 0.5)) + 
  
       scale_y_continuous(limits = c(0,22000), expand = c(0, 0), 
            breaks=c(0, 2000, 4000, 6000, 8000, 10000, 12000, 14000, 16000, 18000, 20000), label = dollar) + 
  
       labs(title="Colorado Health Care Costs") + scale_fill_manual(name ='Color', values = c('lightsalmon','yellowgreen', 'cornflowerblue'))
             
#geom_text(aes(label= values),vjust=-0.8, size=4, angle=90) 
  
  