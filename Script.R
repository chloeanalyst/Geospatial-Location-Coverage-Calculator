library(dplyr)
library(readr)
library(geosphere)


# Read in Data

stop <- read_csv("data/Bus_Stop_Shelter.csv")
hotel <- read_csv("data/Hotels_Properties_Citywide.csv")


# Prep data


stop_data <- as.data.frame(stop %>% select(LATITUDE, LONGITUDE))
stop_locations <- stop %>% select(Street, LONGITUDE, LATITUDE)

hotel_locations <- hotel %>% select(OWNER_NAME, `STREET NAME`, Borough)

hotel <- hotel %>% select(Longitude,Latitude)

test <- get.multi.coverage(hotel,stop_data,5)
test[is.na(test)] <- 0
test <- test %>% cbind(stop_locations)
test$`Count of Hotels Covered` <- unlist(test$`Count of Hotels Covered`)
test <- test %>% distinct






