# Location Coverage Calculator - Geospatial analysis

Functions to calculate how many points are within the radius of a location. 

## Use case example

*Which area of New York has the largest coverage of Hotels within 1km distance of a bus stop?* 

   | Coverage %|Count of Locations Covered|                   Street |
   |-----------|--------------------------|--------------------------|
   |     37.11 |                      2042|                5 AVENUE  |
   |     33.81 |                      1860|                 7 AVENUE |
   |     33.77 |                      1858|          WEST 57 STREET  |


- Midtown Manhattan (5th Avenue) 32 Stops, 37.11% Hotel Coverage. 

<img width="1007" alt="Screenshot 2021-09-12 at 00 33 25" src="https://user-images.githubusercontent.com/52977984/132966047-d5cbcbb6-7aea-4382-8055-ac94f45d9bc3.png">








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
