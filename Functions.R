#### ------ FUNCTIONS

# Create a function to calculate the number of hotels within walking distance of a single bus stop.

get.total.coverage <- function(hotel,lon,lat,distance) {
  
  output <- data.frame(hotel, #Take the hotel data set and calculate the distance of the stop for each row in data frame. (Hotels)
                       coverage = distHaversine(
                         hotel, 
                         c (lon,lat)
                       ) / 1000 < distance) # Convert the distance to Kilometers
  
  
  result <- table(output$coverage) # Extract the coverage results from the output
  result$coverage_percentage <- c (round(result[2] / (result[1] + result[2]) * 100,2)) # Calculate the percentage of Hotels within range of the stop
  result$covered_hotels <- result[2] # Calculate the total number of hotels that are within range of the stop
  result$total_hotels <- nrow(hotel) # The total number of hotels in the data set
  
  # Convert result from a list to a tibble
  
  result <- tibble(result$coverage_percentage,
                   result$covered_hotels,
                   result$total_hotels)
  
  # Rename the columns
  
  names(result) <- c("Coverage %", 
                     "Count of Hotels Covered", 
                     "Total Hotels")  
  
  
  return(result)
  
}



# Create a second function which uses the get.coverage function to calculate the number of hotels within walking distance of multiple bus stops.


get.multi.coverage<- function(hotel,transport,distance){
  
  total_results <- list()
  
  
  for (i in 1:nrow(transport)) { 
    total_results[[i]] <- get.total.coverage(
      hotel,
      transport[i,2],
      transport[i,1],
      distance
    )
  }
  
  total <- do.call(rbind,total_results)
  
  return(total)
  
}
