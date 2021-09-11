# Location Coverage Calculator

Functions to calculate how many points are within the radius of a location. 

Example, how many hotels are within walking distance (1km) of bus stop shelters in New York.

## Functions

### get.total.coverage(locations,lon,lat,distance)

Use case: 
Calculating the number of locations around a single point.

locations:
- data frame
- restrictions = 2 columns only
- column order = 1: Longitude 2: Latitude

lon = Longitude
lat = latitude

distance = km eg: 3

### get.multi.coverage(locations,points,distance)

Use case: 
Calculating the number of locations around multiple points.

locations:
- data frame
- restrictions = 2 columns only
- column order = 1: Longitude 2: Latitude

points:
- data frame
- restrictions = 2 columns only
- column order = 1: Longitude 2: Latitude

lon = Longitude
lat = latitude

distance = km eg: 3



## Data Sources

New York Hotels: https://data.cityofnewyork.us/City-Government/Hotels-Properties-Citywide/tjus-cn27

New York Bus Stops: https://data.cityofnewyork.us/Transportation/Bus-Stop-Shelters/qafz-7myz

## Packages

- dplyr
- readr
- geosphere
