

article_key <- "#########"     # my key to article search API


# return article data for hillary clinton

term <- "hillary+clinton" # Need to use + to string together separate words for multiple terms

begin_date <-"20150101" 
end_date <- "20160101"

#We can use the paste function to create the text for our final URL
finalurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&api-key=",article_key, sep="")

mydata <- fromJSON(finalurl)


# find variable of interest:

names(mydata)
#str(mydata)

names(mydata$response$docs)
#str(mydata$response$docs)


#mydata2 <- as.data.frame(mydata$response) #extract final data to data.frame

#head(mydata2,10)



# find TOTAL articles (note : the API only returns first 10 results from database so it is expected to have low number of articles)

paste(" The total number of articles in first page =", sum(grepl("article", mydata$response$docs$document_type)))


# confirm answer 
mydata$response$docs$document_type

