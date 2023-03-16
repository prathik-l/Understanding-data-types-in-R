data_col <- c("10/15/18", "01/11/18", "10/21/18", "10/28/18", "05/01/18") 
country_col <- c( "US", "US", "IRL", "IRL", "IRL")
gender_col <- c( "M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2) 
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2)
q5_col <- c(5, 5, 2, NA, 1)

managers_data <- data.frame(data_col, 
                            country_col,
                            gender_col,
                            age_col,
                            q1_col,
                            q2_col,
                            q3_col,
                            q4_col,
                            q5_col)

str(managers_data)

column_names <- c("Date", "Country", "Gender", "Age", "q1", "q2", "q3", "q4", "q5")
colnames(managers_data) <- column_names
managers_data
str(managers_data)
#we need to transferes the code using the below given commond
managers_data$Age[managers_data$Age == 99] <- NA
str(managers_data)

#create a new attribute called agecat and set the value
#if  <= then young
# if >= then middle age
#if >=  then elder

# declare agecat
# for length of the manageral_data
# if (age <= 25 then agecat == "young")
# end if
# no loop!
managers_data$AgeCat[managers_data$Age <= 25]  <- "YOUNG"
managers_data$AgeCat[managers_data$Age  >= 26 & managers_data$Age <= 44] <-  "Middle age"
managers_data$AgeCat[managers_data$Age >= 45]  <- "Elder"
str(managers_data)

#recode agecat so that it is catergorical and ordinal
converted_agecat <- factor(managers_data$AgeCat, order = TRUE, levels = c("young","Middle Aged","Elder"))
str(managers_data)

#create a new col  call "summary col" that
#contains summary of each row

#managers_data$summary_col <- 
#  managers_data$q1 +
#  managers_data$q2 +
#  managers_data$q3 +
#  managers_data$q4 +
#  managers_data$q5 
summary_col <-  managers_data$q1 +
    managers_data$q2 +
    managers_data$q3 +
    managers_data$q4 +
    managers_data$q5 
summary_col


#mean_value <- rowMeans(managers_data, mean_value)
summary_col <- rowsum(managers_data[5:9]) 
summary_col
