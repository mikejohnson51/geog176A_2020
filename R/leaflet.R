library(leaflet)
library(htmltools)

UCSB = AOI::geocode("UCSB", pt = TRUE)

m = leaflet() %>% 
  addProviderTiles(providers$CartoDB.Positron) %>% 
  addMarkers(data = UCSB) %>% 
  save_html(m, file = "footer.html")

