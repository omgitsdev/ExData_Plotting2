# read RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract Baltimore City (fips: 24510) emissions
bcEmi = subset(NEI, fips==24510)

png(filename="plot3.png", width=480, height=480, units="px")

library(ggplot2)
#melt the data frame 
bcEmiMelt = melt(bcEmi, id.vars=c("year", "type"), measure.vars=c("Emissions"))
#summarize type + year ~ Emissions
bcEmiSummary = dcast(bcEmiMelt, type+year ~ variable, fun.aggregate=sum)
# ggplot
p = ggplot(bcEmiSummary, aes(x=year, y=Emissions, group=type))

p + geom_line(aes(color=type)) +     
    geom_point() +
    xlab("Year") +
    ylab(expression(Total~PM[2.5]~Emissions~(`in`~tons))) +
    ggtitle(expression(Total~PM[2.5]~Emission~`in`~Baltimore~City)) +
    scale_colour_discrete(name="Type", breaks=c("NON-ROAD", "NONPOINT", "ON-ROAD", "POINT"), labels=c("Non-road", "Non-point", "On-road", "Point"))

dev.off()




# Download dataset if not in directory
# source('./downloadFile.R')

# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# bmore <- NEI[NEI$fips == "24510", ]


# library(ggplot2)

# png(filename="plot3.png", 
#     width=480, height=480)

# g <- ggplot(bmore, aes(year, Emissions, color = type))
# g + geom_line(stat = "summary", fun.y="sum") + ylab("Particle Emission") + ggtitle("Baltimore particle emission by type")
# dev.off()