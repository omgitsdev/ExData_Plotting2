# Download dataset if not in directory
source('./downloadFile.R')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename="plot4.png", 
    width=480, height=480)

coal <- grep("coal", SCC$Short.Name, ignore.case=T)
coalClass <- SCC[coal, ]
data <- NEI[NEI$SCC %in% coalClass$SCC, ]
coalEmission <- aggregate(data$Emissions, list(data$year), FUN="sum")

plot(coalEmission, type="l", xlab="Year", ylab="US Coal Emissions")

dev.off()
