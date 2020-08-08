library(tidyverse)
library(data.table)
library(ggrepel)
library(readxl)
library(scales)

setwd("D:/Users/aleks/Desktop/Regis/MSDS670 Data Visualization/Week 7")

########################################################################
# DWI Rates in Autin

# Open dwi with xlsx
dwi <- read_xlsx('Week_7_In_Class_Exersise_Data.xlsx', sheet = 'DWI Rates')

# Label the first row as column names
colnames(dwi) <- as.character(unlist(dwi[1,]))

#delete first row
dwi = dwi[-1, ]

# Convert to datatable
dwi <- data.table(dwi)

# Check the structure
str(dwi)

# Convert month to factor and set levels
dwi$Month <- factor(dwi$Month, levels = c("January", "February", "March", "April", "May", "June", "July"))

# convert DWI Rates to numveric
dwi$`DWI Rates in Austin` <- as.numeric(dwi$`DWI Rates in Austin`)

# Create a second data seris with the values after Uber/Lyft left
dwi2 <-dwi[5:7]


ggplot(data = dwi, aes(Month, `DWI Rates in Austin`, group = 1, label=`DWI Rates in Austin`)) + 
  geom_point(color = "grey") + geom_line(color = "grey") +
  
   geom_point(data = dwi2, aes(Month, `DWI Rates in Austin`), group = 1, color = "blue") +
   geom_line(data = dwi2, aes(Month, `DWI Rates in Austin`), group = 1, color = "blue") +
   
   geom_text_repel(nudge_y = -15, nudge_x = -0.1, segment.color = 'transparent', colour = "grey") +
  
   geom_text_repel(data = dwi2, aes(dwi2$Month, dwi2$`DWI Rates in Austin`, group = 1), 
                   nudge_y = -15, nudge_x = -0.1, segment.color = 'transparent', colour = "blue") +
   
   scale_y_continuous(limits = c(300, 550)) + xlab("") +
   
   annotate("segment", x = 'May', xend = 'May', y = 500, yend = 425, colour = "red", size=1, arrow=arrow()) + 
   annotate("text", x = 'May', y = 510, label = "Uber and Lyft Left in May" , color="red", size=3)  +
  
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
         panel.background = element_blank(), axis.title.y = element_text(hjust=0.95, vjust = 3)) +
   
  labs(title="DWI Rates in Austin", subtitle = "DWI rates in Austing increased after Uber and Lyft left in May")



