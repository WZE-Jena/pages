<<<<<<< HEAD
# load packages
library(leaflet, quietly = TRUE)
library(dplyr)

# load spatial objects
load("spatial.objects.jena.Rdata")

# plot leaflet, OSM
leaflet(height = 700) %>%
  addTiles() %>%
  flyToBounds(lng1 = jena.bbox[1], 
              lat1 = jena.bbox[2], 
              lng2 = jena.bbox[3], 
              lat2 = jena.bbox[4]) %>% 
  setView(lng = 11.59, lat = 50.918, zoom = 12) %>%
  addPolygons(data = jena.border.invers, 
              fillColor = "grey20", fillOpacity = 0.5, 
              stroke = TRUE, color = "black", 
              opacity = 1, weight = 3) %>% 
  addPolygons(data = jena.forest.area, 
              fillColor = "#006400", fillOpacity = 0.5, 
              stroke = FALSE) %>%   
  fitBounds(lng1 = jena.bbox[1], 
            lat1 = jena.bbox[2],
            lng2 = jena.bbox[3],
            lat2 = jena.bbox[4])

=======
# load packages
library(leaflet, quietly = TRUE)
library(dplyr)

# load spatial objects
load("spatial.objects.jena.Rdata")

# plot leaflet, OSM
leaflet(height = 700) %>%
  addTiles() %>%
  flyToBounds(lng1 = jena.bbox[1], 
              lat1 = jena.bbox[2], 
              lng2 = jena.bbox[3], 
              lat2 = jena.bbox[4]) %>% 
  setView(lng = 11.59, lat = 50.918, zoom = 12) %>%
  addPolygons(data = jena.border.invers, 
              fillColor = "grey20", fillOpacity = 0.5, 
              stroke = TRUE, color = "black", 
              opacity = 1, weight = 3) %>% 
  addPolygons(data = jena.forest.area, 
              fillColor = "#006400", fillOpacity = 0.5, 
              stroke = FALSE) %>%   
  fitBounds(lng1 = jena.bbox[1], 
            lat1 = jena.bbox[2],
            lng2 = jena.bbox[3],
            lat2 = jena.bbox[4])

>>>>>>> 70593e8aba976d68f0c966e5262a0e6727bf6f59
