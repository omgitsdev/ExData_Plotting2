
if(!"nData" %in% ls())
{
  nData <- readRDS("summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("Source_Classification_Code.rds")  
}

# Question 6 
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

towns <- nData[nData$fips == "24510" | nData$fips == "06037",]

motor <- grep("motor", sourceData$Short.Name, ignore.case="T")
motorSource <- sourceData[motor, ]
motorData <- towns[towns$SCC %in% motorSource$SCC,]

png(filename="plot6.png", 
    width=480, height=480)

g <- ggplot(motorData, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y="sum") + 
  ylab("Total Particle Emissions") + 
  ggtitle("Total Particle Emission from motor sources\n in Baltimore and Los Angeles County\n from 1999 until 2008") +
  scale_colour_discrete(name="Cities", label=c("Los Angeles", "Baltimore"))

dev.off()