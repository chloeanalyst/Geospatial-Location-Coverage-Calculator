################################################################################
#                                                            COVERAGE  FUNCTIONS         
################################################################################


## NOTES:

# Calculates whether or not a lat long point is within defined radius of another lat long point.
# Points 2 columns only - column order = 1: Longitude 2: Latitude
# Locations 2 columns only - column order = 1: Longitude 2: Latitude

#------------------------------------------------------------------------------- HIDES WARNINGS

defaultW <- getOption("warn") 
options(warn = -1) 

#---------------------------FUNCTION ONE--------------------------------------------- GET TOTAL COVERAGE
#                                                                                     Calculate the number of locations with a radius of a point.




get.total.coverage <- function(locations,lon,lat,distance) {
  
  output <- data.frame(locations,                                                       #Calculate the distance of the point of interest for each row in locations data frame.
                       coverage = distHaversine(
                                                 locations, 
                                                 c (lon,lat)
                                                ) / 1000 < distance)                    # Convert the distance to Kilometers.
  
  
  result <- table(output$coverage)                                                      # Extract the coverage results from the output.
  result$coverage_percentage <- c(round(result[2] / (result[1] + result[2]) * 100,2))   # Calculate the percentage of locations within range of the point of interest.
  result$covered_locations <- result[2]                                                 # Calculate the total number of locations that are within range of the point of interest.
  result$total_locations <- nrow(locations)                                             # The total number of locations in the data set.
  

  
  result <- tibble(result$coverage_percentage,                                          # Create a tibble of results.
                   result$covered_locations,
                   result$total_locations)
  
  
  
  names(result) <- c("Coverage %",                                                      # Rename the columns.
                     "Count of Locations Covered", 
                     "Total Locations")  
  
  return(result)                                                                        # Prints the output when function is called.
  
}



#------------------------------FUNCTION TWO-------------------------------------  GET TOTAL COVERAGE
#                                                                                 Calculate the number of locations with a radius of multiple points
#                                                                                 Points column order = 1: Longitude 2: Latitude
#                                                                                 Locations column order = 1: Longitude 2: Latitude



get.multi.coverage<- function(locations,points,distance){                                                       #User inputs - data frame of locations (lat,long), data frame of points (lat, long).
  
                             total_results <- list()
                                                          
                                                          
                              for (i in 1:nrow(points)) { 
                                                          total_results[[i]] <- get.total.coverage(
                                                                                    locations,
                                                                                    points[i,1],                 # Iterates over the rows pulling out Latitude & Longitude.
                                                                                    points[i,2],        
                                                                                    distance           
                                                                                                   )             # Stores multiple results as a list.
                                                          }
                                                          
                              total <- as.data.frame(do.call(rbind,total_results))                               # Merges lists into one table.
                              total[is.na(total)] <- 0                                                           # Overwrite NA values 
                              total$`Count of Locations Covered` <- unlist(total$`Count of Locations Covered`)   # Un-lists Coverage (removes Boolean object)
                                                          
                              return(total)                                                                      # Prints table when function is called.
                                                          
                                                          }
