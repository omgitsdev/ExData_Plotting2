# Download dataset if not in directory
source('./downloadFile.R')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


bmore <- NEI[NEI$fips == "24510", ]
total <- aggregate(bmore$Emissions, list(bmore$year), FUN=sum)

png(filename="plot2.png", 
    width=480, height=480)
plot(total, type="l", xlab="Year", ylab="Total Baltimore PM 2.5 Emissions (tons)")
dev.off()