# Download dataset if not in directory
source('./downloadFile.R')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- aggregate(Emissions ~ year, data = NEI, sum)

png(filename = "plot1.png",
    width = 480, height = 480, bg='transparent')
plot(total, type="l", xlab="Year", ylab="Total US PM2.5 emissions (tons)")
dev.off()

