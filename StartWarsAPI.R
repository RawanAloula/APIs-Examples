

#  swapi is an API of Star Wars. It contains data charechtrised by "films","people", "planets", "species", "starships" and "vehicles". The API dosent require a key and the data is well structures. Source: https://swapi.co



# pull people data
my_url <- paste0("https://swapi.co/api/people/")    

#convert from JSON into R object
SW_data <- fromJSON(my_url)

# find a variable of interest:
names(SW_data$results)

#str(SW_data)

# extract data of interest
MyData <- as.data.frame(SW_data$results)


# Who is the tallest?
df <- MyData[order(as.numeric(MyData$height),decreasing = TRUE),]
barplot(as.numeric(df$height),names.arg = df$name, ylab = "cm", main = "Height of Different Star Wars Characters", las=2,col = "dark red")