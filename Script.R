#------------------------------------------------------------------------------- LOAD REQUIRED PACKAGES
library(dplyr)
library(readr)
library(geosphere)
library(purrr)

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



distances <- c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,                           # Define distances
               1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,
               2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3
               )


walking_time <- function(i) {                                                   # Function for distance mapping
  
  distance <- i
  print(i)
  output <- get.multi.coverage(hotel,stop_data,i)                                  
  output <- output %>% cbind(stop_locations)                                       
  output <- output %>% distinct 
  output$distance <- distance
  return(output)

}


result <- map_df(distances, walking_time)                                       # map distances to coverage results.


write.csv(result, "NewYork_Coverage.csv", row.names = F)                        # Save results as CSV 




result %>% filter(distance == 1) %>% arrange(desc(`Coverage %`))

