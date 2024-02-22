
#load ggplot2
library(ggplot2)
library(rlog)
library(dplyr)
library(forcats)
library(DT)
library(zoo)

Sys.setenv("LOG_LEVEL" = "ERROR")
rlog::log_info("#### script startup ####")

#create some fake data
data <- read.csv(file = 'data/zugriffszahlen.csv', sep=',',
                 dec=".", stringsAsFactors=FALSE,
                 colClasses=c("character", rep("numeric",2), "character", "numeric", "numeric", rep("character",5))
)

data$Monat <- as.Date(data$Monat,format="%d.%m.%Y")
data$Jahr <- format(as.Date(data$Monat,format="%d.%m.%Y"), "%Y")

startDate = as.Date("2022-02-01");
endDate = as.Date("2023-12-01");

recentData <- data[data$Monat > startDate & data$Monat < endDate, ]


#data <- data.frame("category" = c('A', 'B', 'C', 'D', 'E'),
#                   "amount" = c(10, 11, 13, 22, 44))

rlog::log_info("Final Data Frame:")
rlog::log_info(str(recentData))


ggplot(recentData, aes(x=Monat,y=Besuche,  colour = Jahr)) +
  geom_col(fill = "lightgrey") +
  theme_gray(base_size = 8 ) +
 geom_smooth(method = "lm", formula = y ~ poly(x, 3), se = FALSE)
# +  geom_line(aes(y=rollmean(Besuche, 4, na.pad=TRUE)),color="darkred")


rlog::log_info("Done Balkendiagramm")
