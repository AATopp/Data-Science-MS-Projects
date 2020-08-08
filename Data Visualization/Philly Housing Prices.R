#Discussion Board Week 7
#Alla Topp
#Data Visualization

# Philly Housing Prices
library(tidyverse)
library(data.table)
library(ggrepel)
library(readxl)
library(scales)

setwd("D:/Users/aleks/Desktop/Regis/MSDS670 Data Visualization/Week 7")

# Open Philly with xlsx
philly <- read_xlsx('Week_7_In_Class_Exersise_Data.xlsx', sheet = 'Philly')

# Label the first row as column names
colnames(philly) <- as.character(unlist(philly[1,]))

#delete first row
philly = philly[-1, ]

# Convert to datatable
philly <- data.table(philly)

# Convert price to numeric
philly$`Number of Square Feet per $1,000,000` <- as.numeric(philly$`Number of Square Feet per $1,000,000`)

# Divide the price per sqf by 10
philly$`Number of Square Feet per $1,000,000` <- philly$`Number of Square Feet per $1,000,000`/10

# Change the Price column name
setnames(philly, "Number of Square Feet per $100,000", "SquareFeet")

# Check the structure
str(philly)

# Subset the data
philly2 <- philly[27:39]
head(philly)

# Your turn to plot

ggplot(data = philly2, aes(x = reorder(City, SquareFeet), y = SquareFeet, 
                          fill = ifelse(City == "Philadelphia", "Highlighted", "Normal"))) +
  
      geom_bar(stat = "identity", width = 0.8)  + coord_flip() + theme_minimal() +
  
      labs(title="Home value size per $100,000 spent", 
           subtitle = "Philadelphia is in top 3d of home value size per $100,000 spent") + 
  
      theme(axis.title.y=element_blank(), axis.title.x=element_blank(), legend.position = "none", 
            plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) +
  
      scale_y_continuous(limits = c(0,9000), expand = c(0, 0), breaks=c(0, 2000, 4000, 6000, 8000, 10000)) 
  

  