/*==============================================================================
                       1:  Results
==============================================================================*/


use "`dataout'\master_dataset.dta", replace


**************************************************
// select gender inequality index based year 

rename gii_1990 gender_index_raw  
**************************************************

* Note: Child` Birth Cohort FE, Mather`s and Father`s Birth Cohort FE and 
* Country FE are contolled in all specifications. 


*_______________________________________________________________________________

* TABLE 2 - Intergenerational education mobility, Baseline model
* Sample = Main sample
asdoc regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender  if  original_sample==1 , replace save(`results'\Table2.doc) title(Table 2) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & original_sample==1 , save(`results'\Table2.doc) title(Table 2) vce(cluster coupleid) nest   cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & original_sample==1 , save(`results'\Table2.doc) title(Table 2) vce(cluster coupleid) nest   cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  original_sample==1 , save(`results'\Table2.doc) title(Table 2) vce(cluster coupleid) nest   cnames(All children) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort   i.gender _cons) add( Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\Table2.doc) title(Table 2) vce(cluster coupleid) nest   cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\Table2.doc) title(Table 2) vce(cluster coupleid) nest    cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label

*_______________________________________________________________________________

* TABLE 3 - Bargaining power and intergenerational education mobility, Relative education as bargaining measure
* Bargaining = maternal education/ paternal education
* Sample = Main sample

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender  if  original_sample==1, replace save(`results'\Table3.doc) title(Table 3) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & original_sample==1 , save(`results'\Table3.doc) title(Table 3) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & original_sample==1 , save(`results'\Table3.doc) title(Table 3) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  original_sample==1 , save(`results'\Table3.doc) title(Table 3)  vce(cluster coupleid) nest cnames(All children) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\Table3.doc) title(Table 3) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\Table3.doc) title(Table 3) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 

*________________________Models with gender norms ______________________________

* Correlation check --> Gender Norms
corr gender_index_raw political_raw business_raw if country!=23 & country!=25 & country!=30 & country!=31 & original_sample==1

 
* TABLE 4 - Bargaining power and intergenerational education mobility, Gender Inequality Index
* Bargaining = maternal education/ paternal education
* Sample = Main sample
 
asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate  c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.gender_index_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.gender_index_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender if  original_sample==1 , replace save(`results'\Table4.doc) title(Table 4) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.gender_index_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.gender_index_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & original_sample==1 , save(`results'\Table4.doc) title(Table 4) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.gender_index_raw c.std_father_median#c.bargaining1_rate  c.std_father_median#c.bargaining1_rate#c.gender_index_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & original_sample==1 , save(`results'\Table4.doc) title(Table 4) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.gender_index_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.gender_index_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  original_sample==1 , save(`results'\Table4.doc) title(Table 4) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort    _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.gender_index_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.gender_index_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\Table4.doc) title(Table 4) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort   _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.gender_index_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.gender_index_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\Table4.doc) title(Table 4) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 

*________________________Models with gender norms ______________________________


* TABLE 5: Bargaining power and intergenerational education mobility, Gender norms
* Sample= Belgium, Ireland, Luxembourg and Israel are excluded from the sample. 
* (WVS and EVS are not available for these countries)

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.gender_index_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.gender_index_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if country!=23 & country!=25 & country!=30 & country!=31 & gender==2 & original_sample==1 , replace save(`results'\Table5.doc) title(Table 5) vce(cluster coupleid)  nest cnames(Norm1) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort   _cons) add( Birth Cohort FE, YES, Country FE, YES, Birth Cohort*Country FE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.political_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.political_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\Table5.doc) title(Table 5) vce(cluster coupleid) nest cnames(Norm2) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort   _cons) add( Birth Cohort FE, YES, Country FE, YES, Birth Cohort*Country FE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.business_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.business_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\Table5.doc) title(Table 5) vce(cluster coupleid) nest cnames(Norm3) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort   _cons) add( Birth Cohort FE, YES, Country FE, YES, Birth Cohort*Country FE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.gender_index_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.gender_index_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if country!=23 & country!=25 & country!=30 & country!=31 & gender==1 & original_sample==1 , save(`results'\Table5.doc) title(Table 5) vce(cluster coupleid) nest cnames(Norm1) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort  _cons) add( Birth Cohort FE, YES, Country FE, YES, Birth Cohort*Country FE, YES,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.political_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.political_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\Table5.doc) title(Table 5) vce(cluster coupleid) nest cnames(Norm2) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort   _cons) add( Birth Cohort FE, YES, Country FE, YES, Birth Cohort*Country FE, YES,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#c.business_raw c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#c.business_raw i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\Table5.doc) title(Table 5)  vce(cluster coupleid) nest cnames(Norm3) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort  _cons) add( Birth Cohort FE, YES, Country FE, YES, Birth Cohort*Country FE, YES,) dec(3) tzok label


*_______________________________________________________________________________

* TABLE 6: Bargaining power and intergenerational education mobility, Heterogeneity by paternal education
* Specification --> Heterogeneity based on Father's Education 
* Bargaining = maternal educ/ paternal educ
* Sample= Main sample


asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate  c.std_mother_median#c.bargaining1_rate  c.std_mother_median#c.bargaining1_rate#i.father_educ_dummy c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#i.father_educ_dummy i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender if  original_sample==1 , replace save(`results'\Table6.doc) title(Table 6) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#i.father_educ_dummy c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#i.father_educ_dummy i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & original_sample==1 , save(`results'\Table6.doc) title(Table 6) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#i.father_educ_dummy c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#i.father_educ_dummy i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & original_sample==1 , save(`results'\Table6.doc) title(Table 6) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#i.father_educ_dummy c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#i.father_educ_dummy i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  original_sample==1 , save(`results'\Table6.doc) title(Table 6) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort   _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_mother_median#c.bargaining1_rate#i.father_educ_dummy c.std_father_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate#i.father_educ_dummy i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\Table6.doc) title(Table 6) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort   _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate  c.std_mother_median#c.bargaining1_rate#i.father_educ_dummy c.std_father_median#c.bargaining1_rate  c.std_father_median#c.bargaining1_rate#i.father_educ_dummy i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\Table6.doc) title(Table 6)  vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label

*_______________________________________________________________________________

* TABLE 7 - Bargaining power and intergenerational education mobility, Further controls for family background 
* Specification --> additional control for family background 
* Bargaining = maternal education/ paternal education
* Sample = Wage sample

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & wage_sample==1 , replace save(`results'\Table7.doc) title(Table 7) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort   _cons) add(BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort mother_lfs_total i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if wage_sample==1 & gender==2  , save(`results'\Table7.doc) title(Table 7) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  _cons) add(BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate log_family_income_euro mother_lfs_total i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if wage_sample==1 & gender==2  , save(`results'\Table7.doc) title(Table 7) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort   _cons) add(BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate maks_number_child log_family_income_euro mother_lfs_total i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if wage_sample==1 & gender==2 , save(`results'\Table7.doc) title(Table 7) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort   _cons) add(BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort if  gender==1 & wage_sample==1 , save(`results'\Table7.doc) title(Table 7) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort   _cons) add(BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort mother_lfs_total i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if wage_sample==1 &  gender==1  , save(`results'\Table7.doc) title(Table 7) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort   _cons) add(BC*CFE, YES,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate log_family_income_euro mother_lfs_total i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if wage_sample==1 &  gender==1  , save(`results'\Table7.doc) title(Table 7) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort  _cons) add(BC*CFE, YES,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate maks_number_child log_family_income_euro mother_lfs_total i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if wage_sample==1 &  gender==1  , save(`results'\Table7.doc) title(Table 7) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort   _cons) add(BC*CFE, YES,) dec(3) tzok label


*_______________________________________________________________________________


* TABLE 8 - Bargaining power and intergenerational education mobility, Relative wage income as bargaining measure
* Bargaining = maternal wage income/ paternal wage income
* Sample = Wage sample

 
asdoc regress std_child_median std_mother_median std_father_median c.bargaining_wage c.std_mother_median#c.bargaining_wage c.std_father_median#c.bargaining_wage  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender  if  wage_sample==1, replace save(`results'\Table8.doc) title(Table 8) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining_wage c.std_mother_median#c.bargaining_wage c.std_father_median#c.bargaining_wage i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & wage_sample==1 , save(`results'\Table8.doc) title(Table 8) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining_wage c.std_mother_median#c.bargaining_wage c.std_father_median#c.bargaining_wage  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & wage_sample==1 , save(`results'\Table8.doc) title(Table 8) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining_wage c.std_mother_median#c.bargaining_wage c.std_father_median#c.bargaining_wage  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  wage_sample==1 , save(`results'\Table8.doc) title(Table 8) vce(cluster coupleid) nest cnames(All children) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining_wage c.std_mother_median#c.bargaining_wage c.std_father_median#c.bargaining_wage  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & wage_sample==1 , save(`results'\Table8.doc) title(Table 8) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median c.bargaining_wage c.std_mother_median#c.bargaining_wage c.std_father_median#c.bargaining_wage  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & wage_sample==1 , save(`results'\Table8.doc) title(Table 8) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 


/*==============================================================================
                       2: APPENDIX
==============================================================================*/

 
* TABLE A1 - Bargaining power and intergenerational education mobility, Level effects
* Bargaining = maternal education/ paternal education
* Sample = Main sample
 
asdoc regress std_child_median std_mother_median std_father_median c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort if gender==2 & original_sample==1 , replace save(`results'\TableA1.doc) title(Table A1) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort  _cons) add(BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\TableA1.doc) title(Table A1) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort  _cons) add(BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\TableA1.doc) title(Table A1) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort  _cons) add(BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\TableA1.doc) title(Table A1)  vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  _cons) add(BC*CFE, YES,) dec(3) tzok label 


*_______________________________________________________________________________

* TABLE A2 - Bargaining power and intergenerational education mobility, Education dummy as bargaining measure 
* Specification --> Robustness check
* Bargaining dummy = maternal educ> paternal educ
* Sample = Main sample

asdoc regress std_child_median std_mother_median std_father_median i.bargaining1 c.std_mother_median#i.bargaining1 c.std_father_median#i.bargaining1  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender  if  original_sample==1, replace save(`results'\TableA2.doc) title(Table A2) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median i.bargaining1 c.std_mother_median#i.bargaining1 c.std_father_median#i.bargaining1 i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & original_sample==1 , save(`results'\TableA2.doc) title(Table A2)  vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median i.bargaining1 c.std_mother_median#i.bargaining1 c.std_father_median#i.bargaining1 i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & original_sample==1 , save(`results'\TableA2.doc) title(Table A2) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median i.bargaining1 c.std_mother_median#i.bargaining1 c.std_father_median#i.bargaining1 i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  original_sample==1 , save(`results'\TableA2.doc) title(Table A2) vce(cluster coupleid) nest cnames(All children) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median i.bargaining1 c.std_mother_median#i.bargaining1 c.std_father_median#i.bargaining1  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\TableA2.doc) title(Table A2) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median i.bargaining1 c.std_mother_median#i.bargaining1 c.std_father_median#i.bargaining1 i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort if  gender==1 & original_sample==1 , save(`results'\TableA2.doc) title(Table A2) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 


*_______________________________________________________________________________

* TABLE A3 - Bargaining power and intergenerational education mobility, Further controls with country fixed effects
* Bargaining = maternal educ/ paternal educ
* Sample = Main sample

asdoc regress std_child_median std_mother_median std_father_median c.std_mother_median#i.country c.std_father_median#i.country c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender  if  original_sample==1, replace save(`results'\TableA3.doc) title(Table A3) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender c.std_mother_median#i.country c.std_father_median#i.country _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#i.country c.std_father_median#i.country c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & original_sample==1 , save(`results'\TableA3.doc) title(Table A3) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender c.std_mother_median#i.country c.std_father_median#i.country _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#i.country c.std_father_median#i.country c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & original_sample==1 , save(`results'\TableA3.doc) title(Table A3) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender c.std_mother_median#i.country c.std_father_median#i.country _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#i.country c.std_father_median#i.country c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  original_sample==1 , save(`results'\TableA3.doc) title(Table A3)  vce(cluster coupleid) nest cnames(All children) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender c.std_mother_median#i.country c.std_father_median#i.country _cons) add( Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#i.country c.std_father_median#i.country c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\TableA3.doc) title(Table A3) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  i.gender c.std_mother_median#i.country c.std_father_median#i.country _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#i.country c.std_father_median#i.country c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & original_sample==1 , save(`results'\TableA3.doc) title(Table A3) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender c.std_mother_median#i.country c.std_father_median#i.country _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 





*_______________________________________________________________________________

* TABLE A4 - Bargaining power and intergenerational education mobility, Nonlinear controls for parental education
* Specification --> Non-linearity check  -- add polynomial degrees for parental education
* Bargaining = maternal educ/ paternal educ
* Sample = Main sample


gen stdm_2=(std_mother_median)^2
gen stdm_3=(std_mother_median)^3
gen stdf_2=(std_father_median)^2
gen stdf_3=(std_father_median)^3


asdoc regress std_child_median std_mother_median stdm_2 stdm_3 std_father_median stdf_2 stdf_3 c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender  if  original_sample==1, replace save(`results'\TableA4.doc) title(Table A4) vce(cluster coupleid) nest cnames(All children) drop(stdm_2 stdm_3 stdf_2 stdf_3 i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median stdm_2 stdm_3 std_father_median stdf_2 stdf_3 c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & original_sample==1 , save(`results'\TableA4.doc) title(Table A4) vce(cluster coupleid) nest cnames(Daughters) drop(stdm_2 stdm_3 stdf_2 stdf_3 i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label

asdoc regress std_child_median std_mother_median stdm_2 stdm_3 std_father_median stdf_2 stdf_3 c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & original_sample==1 , save(`results'\TableA4.doc) title(Table A4) vce(cluster coupleid) nest cnames(Sons) drop(stdm_2 stdm_3 stdf_2 stdf_3 i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median stdm_2 stdm_3 std_father_median stdf_2 stdf_3 c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort i.gender i.country#i.gender if  original_sample==1 , save(`results'\TableA4.doc) title(Table A4)  vce(cluster coupleid) nest cnames(All children) drop(stdm_2 stdm_3 stdf_2 stdf_3 i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort i.gender _cons) add( Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median stdm_2 stdm_3 std_father_median stdf_2 stdf_3 c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort if gender==2 & original_sample==1 , save(`results'\TableA4.doc) title(Table A4) vce(cluster coupleid) nest cnames(Daughters) drop(stdm_2 stdm_3 stdf_2 stdf_3 i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median stdm_2 stdm_3 std_father_median stdf_2 stdf_3 c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.child_birth_cohort if  gender==1 & original_sample==1 , save(`results'\TableA4.doc) title(Table A4) vce(cluster coupleid) nest cnames(Sons) drop(stdm_2 stdm_3 stdf_2 stdf_3 i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 


*_______________________________________________________________________________


* TABLE A5 - Bargaining power and intergenerational education mobility, Weights 
* Specification --> weights 
* Bargaining = maternal educ/ paternal educ
* Sample = Main sample
 
 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate  c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country   if gender==2 & bargaining1_rate!=. , replace save(`results'\TableA5.doc) title(Table A5) vce(cluster coupleid)  nest cnames(W0) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country    _cons) add( Country FE, YES, Birth Cohort FE, YES, Parent Birth Cohort FE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate  c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  [aweight = weight_1] if gender==2 & bargaining1_rate!=. , save(`results'\TableA5.doc) title(Table A5) vce(cluster coupleid) nest cnames(W1) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country    _cons) add( Country FE, YES, Birth Cohort FE, YES, Parent Birth Cohort FE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate  c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  [aweight = weight_2] if gender==2 & bargaining1_rate!=. , save(`results'\TableA5.doc) title(Table A5) vce(cluster coupleid) nest cnames(W2) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country    _cons) add( Country FE, YES, Birth Cohort FE, YES, Parent Birth Cohort FE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate  c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & bargaining1_rate!=. , save(`results'\TableA5.doc) title(Table A5) vce(cluster coupleid) nest cnames(W0) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  _cons) add( Country FE, YES, Birth Cohort FE, YES, Parent Birth Cohort FE, YES,) dec(3) tzok label
 
asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate  c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  [aweight = weight_1] if  gender==1 & bargaining1_rate!=. , save(`results'\TableA5.doc) title(Table A5) vce(cluster coupleid) nest cnames(W1) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  _cons) add( Country FE, YES, Birth Cohort FE, YES, Parent Birth Cohort FE, YES,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate  c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country   [aweight = weight_2] if  gender==1 & bargaining1_rate!=. , save(`results'\TableA5.doc) title(Table A5) vce(cluster coupleid) nest cnames(W2) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  _cons) add( Country FE, YES, Birth Cohort FE, YES, Parent Birth Cohort FE, YES,) dec(3) tzok label


*_______________________________________________________________________________
 

* TABLE A6 - Bargaining power and intergenerational education mobility, Further control for number of children
* Specification --> Controlling number of children 
* Bargaining = maternal education/ paternal education
* Sample = Main sample

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate maks_number_child  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender  if  original_sample==1, replace save(`results'\TableA6.doc) title(Table A6) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate maks_number_child i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & original_sample==1 , save(`results'\TableA6.doc) title(Table A6) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate maks_number_child i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & original_sample==1 , save(`results'\TableA6.doc) title(Table A6) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate maks_number_child i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  original_sample==1 , save(`results'\TableA6.doc) title(Table A6) vce(cluster coupleid) nest cnames(All children) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate maks_number_child i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & original_sample==1 , save(`results'\TableA6.doc) title(Table A6) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate maks_number_child i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort if  gender==1 & original_sample==1 , save(`results'\TableA6.doc) title(Table A6) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 

*_______________________________________________________________________________


* TABLE A7 - Bargaining power and intergenerational education mobility, Main specification with wage sample 
* Bargaining = maternal education/ paternal education
* Sample = Wage sample

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.gender i.country#i.gender  if  wage_sample==1, replace save(`results'\TableA7.doc) title(Table A7) vce(cluster coupleid) nest cnames(All children) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, YES, Country*Gender FE, YES, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if   gender==2 & wage_sample==1 , save(`results'\TableA7.doc) title(Table A7) vce(cluster coupleid) nest cnames(Daughters) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  if  gender==1 & wage_sample==1 , save(`results'\TableA7.doc) title(Table A7) vce(cluster coupleid) nest cnames(Sons) drop(i.gender i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  _cons) add(Gender Control, NO, Country*Gender FE, NO, BC*CFE, NO,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  i.gender i.country#i.gender if  wage_sample==1 , save(`results'\TableA7.doc) title(Table A7) vce(cluster coupleid) nest cnames(All children) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, YES, Country*Gender FE, YES, BC*CFE, YES,) dec(3) tzok label 

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if gender==2 & wage_sample==1 , save(`results'\TableA7.doc) title(Table A7) vce(cluster coupleid) nest cnames(Daughters) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label  

asdoc regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.country#i.child_birth_cohort  if  gender==1 & wage_sample==1 , save(`results'\TableA7.doc) title(Table A7) vce(cluster coupleid) nest cnames(Sons) drop(i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country i.country#i.gender  i.country#i.child_birth_cohort  i.gender _cons) add( Gender Control, NO, Country*Gender FE, NO, BC*CFE, YES,) dec(3) tzok label 


/*==============================================================================
                       3: Descriptive Statistics
==============================================================================*/

* TABLE 1 - Descriptive Statistics
**Panel A

*All sample
sum year_birth if original_sample==1 & gender==2
sum year_birth if original_sample==1 & gender==1
sum child_median_1 if original_sample==1 & gender==2
sum child_median_1 if original_sample==1 & gender==1
sum mother_median_1 if original_sample==1
sum father_median_1 if original_sample==1

*Wage sample
sum year_birth if wage_sample==1 & gender==2 
sum year_birth if wage_sample==1 & gender==1 
sum child_median_1 if wage_sample==1 & gender==2 
sum child_median_1 if wage_sample==1 & gender==1 
sum mother_median_1 if wage_sample==1 
sum father_median_1 if wage_sample==1 

**Panel B
*All sample
tab c_education3_level if original_sample==1 & gender==2
tab c_education3_level if original_sample==1 & gender==1
tab m_education3_level if original_sample==1
tab f_education3_level if original_sample==1 

*Wage sample
tab c_education3_level if  gender==2 & wage_sample==1
tab c_education3_level if  gender==1 & wage_sample==1
tab m_education3_level if  wage_sample==1
tab f_education3_level if  wage_sample==1

**Panel C

*All sample
sum bargaining1_rate if  original_sample==1
sum bargaining1 if  original_sample==1

*Wage sample
sum bargaining1_rate if wage_sample==1 
sum bargaining1 if wage_sample==1 
sum bargaining_wage if wage_sample==1 

**Male ratio
preserve 
replace gender=0 if gender==2 
sum gender if original_sample==1
sum gender if wage_sample==1
restore
 
*________________________________________________

* TABLE A8 - Descriptive statistics by countries 
   
preserve
keep if original_sample==1
gen number_of_observations=1
collapse (sum)number_of_observations (mean)child_median_1 (mean)mother_median_1 (mean)father_median_1 (mean)year_birth (mean)mother_year (mean)father_year,  by(country) 
export excel using "`results'\descriptive statistics by country.xlsx", sheet(A8) replace firstrow(variables)
restore


clear 
*----------------------------END OF DO FILE-------------------------------------
*-------------------------------------------------------------------------------







