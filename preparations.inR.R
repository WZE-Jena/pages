# load packages
library(geojsonio, quietly = TRUE)
library(sf, quietly = TRUE)
library(rmapshaper)
library(dplyr)

# load shp 
## Grenzen Jena, invert
Jena.border.WGS84 <- geojson_sf("./shp/Grenze_Jena_invers.shp") %>%
  st_transform(, crs = 4326)
Jena.border.WGS84.buffer <- st_buffer(Jena.border.WGS84, 
                                      dist = 90000)
jena.border.invers <- ms_erase(Jena.border.WGS84.buffer,
                               Jena.border.WGS84)
jena.bbox <- st_bbox(Jena.border.WGS84) %>% 
  unname()
# read forested area from WALDBIOTOPE.shp
jena.forest.area <- geojson_sf("./shp/WALDBIOTOPE.shp") %>%
  st_transform(, crs = 4326) %>% 
  ms_clip(., Jena.border.WGS84, remove_slivers = TRUE) %>% 
  ms_dissolve() 

save(jena.border.invers, jena.bbox, jena.forest.area, file = "spatial.objects.jena.Rdata")
