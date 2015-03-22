# Download dataset if not in directory
source('./downloadFile.R')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename="plot5.png", 
    width=480, height=480)

bmore <- NEI[NEI$fips == "24510", ]
motor <- grep("motor", SCC$Short.Name, ignore.case="T")
motorClass <- SCC[motor, ]
data <- bmore[bmore$SCC %in% motorClass$SCC,]
motorEmission <- aggregate(data$Emissions, list(data$year), FUN="sum")

plot(motorEmission, type="l", xlab="Year", ylab="Baltimore Vehicle Emission (tons)")

dev.off()