#read the csv file into the data fram
eruptiondeaths <- read.csv('Data/EruptionDeaths.csv')
#create a sf object with point data by concatenating lat and lon
vei_sf <- st_as_sf(eruptiondeaths, coords = c("Longitude", "Latitude"), crs = 4326)
#read the data to make sure it worked
vei_sf
#create a map of volcano eruptions in tmap and add interactivity with leaflet
data(World)
tmap_mode("view") #creates interactive map with leaflet

tm_shape(vei_sf) + #creates layer from sf point geometry
tm_bubbles(size = "VEI", col = "Type") #set size and color of bubbles
