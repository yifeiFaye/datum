library(httr)
# getting all facts for a person with person_id
r <- GET("https://datum-us.yougov.net/api/persons/us:37504681/facts/")
status_code(r)
headers(r)
str(content(r))
content(r)$objects[[2]]
content(r)$objects[[2]]$value
#v the attributes in facts table are: id, difinition, person_id, time_lower, time_upper, writer, value, url, meta
bar <- function(x){content(r)$objects[[x]]$definition}
n <- length(content(r)$objects)
l <- c(1:n)
lapply(l, bar)

# get a single fact about a person:
r <- GET("https://datum-us.yougov.net/api/persons/us:37504681/facts/inputzip/")
# ?why it's an empty objects?

# get all fact definitions in Datum in a namespace
r <- GET("https://datum.yougov.net/api/namespaces/panel:1/definitions/")
r <- GET("https://datum.yougov.net/api/namespaces/panel:1/definitions/income/")
r <- GET("https://datum.yougov.net/api/namespaces/panel:1/definitions/income/options/")
content(r)$type
content(r)$meta$qsl

# search for definitions
# parameters to use:
#   namespace
#   codebook
#   attribute(fieldname)
#   active: true/false/null
#   readonly: true/false/null
#   computed: true/false/null
#   pii: true/false/null
r<- GET("https://datum.yougov.net/api/search/?namespace=panel:1&active=true&attribute=name&query=age")
content(r)$objects[[20]]$meta$qsl
content(r)$objects[[1]]$name


