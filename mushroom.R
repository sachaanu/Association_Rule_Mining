getwd()
#reading txt data file
data <- read.table("agaricus-lepiota.txt", sep = ',')

#checking dimension & first 5 rows
head(d)
dim(d)
summary(d)

#renaming columns with approprite names
library(plyr)
data <- rename(data, c("V1"="class", "V2"="cap_shape", "V3"="cap_surface","V4"="cap_color","V5"="bruises","V6"="odor","V7"="gill_attachment",
               "V8"="gill_spacing","V9"="gill_size","V10"="gill_color","V11"="stalk_shape","V12"="stalk_root","V13"="stalk_surface_above_ring",
               "V14"="stalk_surface_below_ring","V15"="stalk_color_above_ring","V16"="stalk_color_below_ring","V17"="veil_type","V18"="veil_color",
               "V19"="ring_number","V20"="ring_type","V21"="spore_sprint_color","V22"="population","V23"="habitat"))

str(data)
head(data)

#checking and removing column with Unknown values
levels(data$stalk_root)
table(data$stalk_root)
data$stalk_root <- NULL

summary(data)

#compairing size of renamed column dataset vs original column data set - only few bytes have been added
object.size(data)
object.size(d)
dim(data)

#installing required packages for apriori - association algorithm
install.packages('arules')
install.packages('arulesViz')
library('arules')
library('arulesViz')

#applying apriori on dataset
rule <- apriori(data)

#checking first 50 rules
summary(rule)
inspect(rule[1:50])

#creating rules with the higher confidence
rules = apriori(data, parameter=list(support=0.005, confidence=0.9))
summary(rules)
inspect(rules[1:50])

#sorting rules by lift
rules_new <- sort(rules, by='lift',decreasing=TRUE)
inspect(rules_new[1:50])

summary(rules_new)

#creating rules with only class as rhs
rules_class <- apriori(data, parameter=list(support=0.005, confidence=0.9),appearance = list(rhs=c("class=e","class=p"),default="lhs"))
inspect(rules_class[1:5])
summary(rules_class)

#removing redundant of repetetive rules &keeping just unique rules

pruned <- rules_class[!is.redundant(rules_class,measure ='confidence')]
summary(pruned)
inspect(pruned[1:50])

#sorting by top 50 rules again
pruned_sort <- sort(pruned, by='lift',decreasing=TRUE)
summary(pruned)

#plotting the sorted, unique rules shaded by confidence
plot(pruned_sort, measure=c("support","lift"), shading="confidence")

#plotting rules but shading by order of rule
plot(pruned_sort, shading="order", control=list(main ="Two-key plot"));

p <- pruned_sort[1:20]
plot(p, method="graph")

#plotting top 20 rules as nodes
plot(p, method="graph",edgeCol = grey(.6),alpha = .9)

