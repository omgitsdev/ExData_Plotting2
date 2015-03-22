if (!file.exists('summarySCC_PM25.rds')) {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip', 'dataset.zip', method='curl')
  unzip('dataset.zip')
  file.remove('dataset.zip')
}