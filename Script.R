#------------------------------------------------------------------------------- LOAD REQUIRED PACKAGES
library(dplyr)
library(readr)
library(geosphere)

#------------------------------------------------------------------------------- LOAD REQUIRED FUNCTIONS
source("Functions.R")

#------------------------------------------------------------------------------- READ IN DATA

stop <- read_csv("data/Bus_Stop_Shelter.csv")
hotel <- read_csv("data/Hotels_Properties_Citywide.csv")


#------------------------------------------------------------------------------- PREPARE DATA


stop_data <- as.data.frame(stop %>% select(LONGITUDE,LATITUDE))                 # Location points - To be used within the function.
stop_locations <- stop %>% select(Street, LONGITUDE, LATITUDE)                  # Names - To be joined to the output.

hotel <- hotel %>% select(Longitude,Latitude)                                   # Locations to be counted.


#------------------------------------------------------------------------------- CALCULATE COVERAGE


output <- get.multi.coverage(hotel,stop_data,5)                                  # Call Function
output <- output %>% cbind(stop_locations)                                       # Add point names and lat longs to coverage data
output <- output %>% distinct                                                    # Ensures data is unique.






