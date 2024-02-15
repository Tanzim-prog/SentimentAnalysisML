#install.packages("rvest")
#install.packages("dplyr")

library(rvest)
library(dplyr)

hotel_review_dataset = data.frame()

link = "https://www.tripadvisor.com/Hotel_Review-g667997-d23981995-Reviews-Grand_Sylhet_Hotel_Resort-Sylhet_City_Sylhet_Division.html#REVIEWS"
hotel = read_html(link)

reviewer_name = hotel %>% html_nodes(".uyyBf") %>% html_text()
review = hotel %>% html_nodes(".vTVDc > .FKffI ._T") %>% html_text()

hotel_review_dataset = data.frame(reviewer_name, review, stringsAsFactors = FALSE)

write.csv(hotel_review_dataset, "Grand Sylhet Hotel & Resort (page 1).csv")
