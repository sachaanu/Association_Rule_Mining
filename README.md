# Association_Rule_Mining

This exercise applies Association Rule Mining by using apriori algorithm on the Mushroom dataset at UCI : 

https://archive.ics.uci.edu/ml/datasets/mushroom

Analyses follows below steps:

* Loading & Renaming the columns.

* Checking & removing the column with Unknown values

* Applying the apriori algorithm

* Creating rules with higher confidence = 0.9 & sorting by Lift

* Creating rules with only class as edible/poisenous on RHS

* Removing redundant & repetetive rules.

* Sorting top rules by Lift.

Heatmap of all 3080 rules by Support & Confidence:

<img width="632" alt="screen shot 2017-10-31 at 10 51 27 am" src="https://user-images.githubusercontent.com/26288770/32230608-f2109f6e-be29-11e7-94ed-3f4522e43274.png">



Vizualizing the sorted top 20 rules by Lift as nodes:


<img width="633" alt="screen shot 2017-10-31 at 10 51 56 am" src="https://user-images.githubusercontent.com/26288770/32230660-0c5f11e8-be2a-11e7-86ee-631521cdce8d.png">

