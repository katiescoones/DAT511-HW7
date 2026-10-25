# DAT 511 - Homework 7

# Question 1: Idaho Housing Data

### Load the data
housing <- read.csv("getdata_data_ss06hid.csv")

### Check the data 
dim(housing)
names(housing)

### Count properties worth $1,000,000 or more 
result <- sum(housing$VAL == 24, na.rm = TRUE)
print(result)


# Question 2: Natural Gas Acquisition Program

### Load the excel
library(readxl)

### Read rows 18-23 and columns 7-15
dat <- read_excel(
  "getdata_data_DATA.gov_NGAP.xlsx",
  range = "G18:O23",
  col_names = TRUE
)

### Check the data
names(dat)

### Calculate the sum

q2result <- sum(dat$Zip*dat$Ext,na.rm=T) 
print(q2result)

# Question 3: Baltimore Restaurants

### Load the XML package
if (!requireNamespace("xml2", quietly = TRUE)) {
  install.packages("xml2")
}
library(xml2)

### Read the data
restaurants <- read_xml("getdata_data_restaurants.xml")

### Extract restaurant zip codes
zipcodes <- xml_text(
  xml_find_all(restaurants, ".//zipcode")
)

# Count restaurants with ZIP code 21231
q3result <- sum(zipcodes == "21231", na.rm = TRUE)
print(q3result)