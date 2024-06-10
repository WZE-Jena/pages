library(leaflet, quietly = TRUE)
library(geojsonio, quietly = TRUE)
library(sf, quietly = TRUE)
library(rmapshaper)
library(dplyr)

# load border and invert
Jena.border.WGS84 <- geojson_sf("./shp/Grenze_Jena_invers.shp") %>%
  st_transform(, crs = 4326)
Jena.border.WGS84.buffer <- st_buffer(Jena.border.WGS84, 
                                      dist = 90000)
Jena_invers.WGS84 <- ms_erase(Jena.border.WGS84.buffer,
                              Jena.border.WGS84)
bbox <- st_bbox(Jena.border.WGS84) %>% 
  unname()
# plot
leaflet(height = 700) %>%
  addTiles() %>%
  flyToBounds(lng1 = bbox[1], 
              lat1 = bbox[2], 
              lng2 = bbox[3], 
              lat2 = bbox[4]) %>% 
  setView(lng = 11.59, lat = 50.918, zoom = 12) %>%
  addPolygons(data = Jena_invers.WGS84, 
              fillColor = "grey20", fillOpacity = 0.5, 
              stroke = TRUE, color = "black", opacity = 1) %>% 
  fitBounds(lng1 = bbox[1], 
            lat1 = bbox[2],
            lng2 = bbox[3],
            lat2 = bbox[4])




|> 
  flyToBounds(lng1 = bbox[1], lat1 = bbox[2], lng2 = bbox[3], lat2 = bbox[4]) |>
  # zoom Jena
  setView(lng = 11.59, lat = 50.918, zoom = 12) |> 
  addPolygons(coord.poly[,1], coord.poly[,2], fill = FALSE, color = "blue", weight = 4, noClip = TRUE) 

|>  
  fitBounds(lng1 = bbox[1], 
            lat1 = bbox[2],
            lng2 = bbox[3],
            lat2 = bbox[4])



gemeinde.grenzen <- geojson_read("shp/gemeinden_simplify200.geojson", what = "sp")
coord.poly <- gemeinde.grenzen@polygons[[1]]@Polygons[[1]]@coords
bbox <- st_bbox(gemeinde.grenzen) %>% 
  unname()
library(rgdal)
Jena_invers <- readOGR("./shp/Grenze_Jena_invers.shp", verbose = FALSE)`
#Jena_invers <- st_read("./shp/Grenze_Jena_invers.shp", layer = "Grenze_Jena_invers")
Jena_invers2 <- spTransform(Jena_invers, "+init=epsg:4326")