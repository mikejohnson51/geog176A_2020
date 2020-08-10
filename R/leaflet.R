library(leaflet)
library(htmltools)
library(sf)
library(dplyr)

df = bind_rows(
  data.frame(name = 'Mike Johnson', url = 'http://mikejohnson51.github.io', role = "Instructor", interest = "Water Resources", lat = 34.4140,  lng = -119.8489),
  data.frame(name = 'Jiwon Baik', url = '', role = "Teaching Assistant", interest = "", lat = 35.9,  lng =  127.7),
  data.frame(name = 'Matt Feliciano', url = '', role = "Teaching Assistant", interest = "", lat = 40.1,  lng = -74.4),
) %>% 
st_as_sf(coords = c("lng", "lat"), crs = 4326)
  
df$name =  paste0('<a href=', df$url, '>', df$name, "</a>")

pop <- paste(
    paste("<strong>", df$name,"</strong>"),
    paste("<strong>Major/Year:</strong>", df$role),
    paste("<strong>Interest:</strong>", df$interest),
    sep = "<br/>"
  )


leaflet() %>% 
  addProviderTiles(providers$CartoDB.Positron) %>% 
  addMarkers(data = df, popup = pop) %>% 
  save_html(file = "footer.html")

