/*==============================================================================
                       1:  Main Figures
==============================================================================*/


// deploy master dataset

use "`dataout'\master_dataset.dta", replace


***use coeff estimates from Tables 0 and 1
*** predicted education of daughters and sons

**model 0

	*model 0-all children
	 regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.child_birth_cohort#i.country i.gender i.country#i.gender if  original_sample==1,  vce(cluster coupleid)  
	
	local m0_1=_b[std_mother_median]
	local m0_2=_b[std_father_median]
	
	*model 0
	*model 0 daughters - 5th col
	regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.child_birth_cohort#i.country if gender==2 & original_sample==1,  vce(cluster coupleid) 

	local m0d_1=_b[std_mother_median]
	local m0d_2=_b[std_father_median]

	*model 0 sons - 6th col
	regress std_child_median std_mother_median std_father_median i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.child_birth_cohort#i.country if  gender==1 & original_sample==1,  vce(cluster coupleid) 
	local m0s_1=_b[std_mother_median]
	local m0s_2=_b[std_father_median]
	
	

**model 1
	*model 1- all children
	regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.child_birth_cohort#i.country i.gender i.country#i.gender if  original_sample==1, vce(cluster coupleid)  
	
	local m1_1=_b[std_mother_median]
	local m1_2=_b[std_father_median]
	local m1_3=_b[c.bargaining1_rate]
	local m1_4=_b[c.std_mother_median#c.bargaining1_rate]
	local m1_5=_b[c.std_father_median#c.bargaining1_rate]

		
	*model 1 daughters - 5th col
	regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.child_birth_cohort#i.country if gender==2 & original_sample==1,  vce(cluster coupleid) 
	local m1d_2=_b[std_father_median]
	local m1d_3=_b[c.bargaining1_rate]
	local m1d_4=_b[c.std_mother_median#c.bargaining1_rate]
	local m1d_5=_b[c.std_father_median#c.bargaining1_rate]


		
	*model 1 sons - 6th col
	regress std_child_median std_mother_median std_father_median c.bargaining1_rate c.std_mother_median#c.bargaining1_rate c.std_father_median#c.bargaining1_rate  i.child_birth_cohort i.father_birth_cohort i.mother_birth_cohort i.country  i.child_birth_cohort#i.country if  gender==1 & original_sample==1, vce(cluster coupleid) 
	local m1s_1=_b[std_mother_median]
	local m1s_2=_b[std_father_median]
	local m1s_3=_b[c.bargaining1_rate]
	local m1s_4=_b[c.std_mother_median#c.bargaining1_rate]
	local m1s_5=_b[c.std_father_median#c.bargaining1_rate]
	

***figures

	*fathers schooling - mean years  - in std dev
	local f1std=0
	local f1abs=10.55
	
	*father-1 sd below
	local f1abs1=6.94
	local f1std1=(6.94-10.55)/3.61
	
	*father - mean
	local f1abs2=10.55
	local f1std2=(10.55-10.55)/3.61
	
	*father - 1 sd above
	local f1abs3=14.16
	local f1std3=(14.16-10.55)/3.61
	
	*father - 2 sd below
	local f1abs4=3.33
	local f1std4=(3.33-10.55)/3.61
	
	*father - 2 sd above
	local f1abs5=17.77
	local f1std5=(17.77-10.55)/3.61
	
*_____________________________1.1 Figure 1______________________________________


	
	*DOES BARGAINING SPECIFICATION IMPLY LARGER EDUCTIONAL ATTAINMENT FOR ALL CHILDREN COMPARED TO STANDARD MODEL?
		
		* PAPER FIGURE 1 - model 1 bargaining coeffs- father educ: 1 sd below, mean, 1 sd above
		*x refers to mothers educ in std deviations
		twoway function y=`m1_3'*((x*3.52+10.10)/`f1abs1')+ `m1_4'*x*((x*3.52+10.10)/`f1abs1')+`m1_5'*`f1std1'*((x*3.52+10.10)/`f1abs1'), range(-2 2) yscale(range(-0.1 0.1)) ylabel(-0.1 (0.05) 0.1) yvarl("father low educ") || /*
		*/     function y=`m1_3'*((x*3.52+10.10)/`f1abs2')+ `m1_4'*x*((x*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((x*3.52+10.10)/`f1abs2'), range(-2 2) yscale(range(-0.1 0.1)) ylabel(-0.1 (0.05) 0.1) yvarl("father mean educ") || /*
		*/     function y=`m1_3'*((x*3.52+10.10)/`f1abs3')+ `m1_4'*x*((x*3.52+10.10)/`f1abs3')+`m1_5'*`f1std3'*((x*3.52+10.10)/`f1abs3'), range(-2 2) yscale(range(-0.1 0.1)) ylabel(-0.1 (0.05) 0.1) yvarl("father high educ") xtitle("maternal education (std)") ytitle("△(child education) (std)")/*
		
		
		*/      legend(size(small) symysize(0.7) symxsize(1.6) pos(6) forcesize rows(1) order(1 2 3) label(1 "Father educ low (-1 sd)") label(2 "Father educ mean") label(3 "Father educ high (+1 sd)")) /*title("Effect of maternal education")*/			
                graph save "`figures'\figure1", replace
		
		*rangeof (maternal educ/paternal educ): when maternal educ -2 sd below and 2 std dev above mean
		*estimated increase in mean educ of children
		
		*father educ low
		di (-2*3.52+10.10)/`f1abs1'
		di (2*3.52+10.10)/`f1abs1'
		di (`m1_3'*((2*3.52+10.10)/`f1abs1')+ `m1_4'*2*((2*3.52+10.10)/`f1abs1')+`m1_5'*`f1std1'*((2*3.52+10.10)/`f1abs1'))-(`m1_3'*((-2*3.52+10.10)/`f1abs1')+ `m1_4'*-2*((-2*3.52+10.10)/`f1abs1')+`m1_5'*`f1std1'*((-2*3.52+10.10)/`f1abs1'))
		
				
		
		*father mean educ
		di (-2*3.52+10.10)/`f1abs2'
		di (2*3.52+10.10)/`f1abs2'
		di (`m1_3'*((2*3.52+10.10)/`f1abs2')+ `m1_4'*2*((2*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((2*3.52+10.10)/`f1abs2'))-(`m1_3'*((-2*3.52+10.10)/`f1abs2')+ `m1_4'*-2*((-2*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((-2*3.52+10.10)/`f1abs2'))
		
		
		*father high educ
		di (-2*3.52+10.10)/`f1abs3'
		di (2*3.52+10.10)/`f1abs3'
		di (`m1_3'*((2*3.52+10.10)/`f1abs3')+ `m1_4'*2*((2*3.52+10.10)/`f1abs3')+`m1_5'*`f1std3'*((2*3.52+10.10)/`f1abs3'))-(`m1_3'*((-2*3.52+10.10)/`f1abs3')+ `m1_4'*-2*((-2*3.52+10.10)/`f1abs3')+`m1_5'*`f1std3'*((-2*3.52+10.10)/`f1abs3'))
	
*_____________________________1.2 Figure 2______________________________________

		
		*PAPER FIGURE 2- *daughters and sons educ RELATIVE TO ALL CHILDREN mean 
		*model 1 bargaining coeffs-***WITHOUT*** maternal and paternal educ main coeffs
		*father educ set at mean education; mother educ changes in std deviations
		*x refers to mothers educ in std deviations
		
		twoway  function y=(`m1d_3'*((x*3.52+10.10)/`f1abs2')+`m1d_4'*x*((x*3.52+10.10)/`f1abs2')+`m1d_5'*`f1std2'*((x*3.52+10.10)/`f1abs2'))-(`m1_3'*((x*3.52+10.10)/`f1abs2')+ `m1_4'*x*((x*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((x*3.52+10.10)/`f1abs2')), range(-2 2) yvarl("Daughters") || /*
		*/      function y=(`m1s_3'*((x*3.52+10.10)/`f1abs2')+`m1s_4'*x*((x*3.52+10.10)/`f1abs2')+`m1s_5'*`f1std2'*((x*3.52+10.10)/`f1abs2'))-(`m1_3'*((x*3.52+10.10)/`f1abs2')+ `m1_4'*x*((x*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((x*3.52+10.10)/`f1abs2')), range(-2 2) yvarl("Sons") xtitle("maternal education (std)") ytitle("△(child education relative to mean) (std)")/*
		*/      legend(size(small) symysize(0.7) symxsize(1.6) forcesize rows(1) order(1 2) label(1 "Daughters") label(2 "Sons"))
		      graph save "`figures'\figure2", replace

		*Daughters education relative to mean when maternal educ equals -2 and 2
		local d1=(`m1d_3'*((2*3.52+10.10)/`f1abs2')+`m1d_4'*2*((2*3.52+10.10)/`f1abs2')+`m1d_5'*`f1std2'*((2*3.52+10.10)/`f1abs2'))-(`m1_3'*((2*3.52+10.10)/`f1abs2')+ `m1_4'*2*((2*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((2*3.52+10.10)/`f1abs2'))
		local d2=(`m1d_3'*((-2*3.52+10.10)/`f1abs2')+`m1d_4'*-2*((-2*3.52+10.10)/`f1abs2')+`m1d_5'*`f1std2'*((-2*3.52+10.10)/`f1abs2'))-(`m1_3'*((-2*3.52+10.10)/`f1abs2')+ `m1_4'*-2*((-2*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((-2*3.52+10.10)/`f1abs2'))
		di `d1'-`d2'
		*Sons education relative to mean when maternal educ equals -2 and 2
		local d1=(`m1s_3'*((2*3.52+10.10)/`f1abs2')+`m1s_4'*2*((2*3.52+10.10)/`f1abs2')+`m1s_5'*`f1std2'*((2*3.52+10.10)/`f1abs2'))-(`m1_3'*((2*3.52+10.10)/`f1abs2')+ `m1_4'*2*((2*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((2*3.52+10.10)/`f1abs2'))
		local d2=(`m1s_3'*((-2*3.52+10.10)/`f1abs2')+`m1s_4'*-2*((-2*3.52+10.10)/`f1abs2')+`m1s_5'*`f1std2'*((-2*3.52+10.10)/`f1abs2'))-(`m1_3'*((-2*3.52+10.10)/`f1abs2')+ `m1_4'*-2*((-2*3.52+10.10)/`f1abs2')+`m1_5'*`f1std2'*((-2*3.52+10.10)/`f1abs2'))
		di `d1'-`d2'
 
clear 

/* Following section could be used to produce country specific age-earning profiles.

/*==============================================================================
                       2:  Age-Earning Profiles
==============================================================================*/


** AUSTRIA

use `Austria_job_episode',replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Austria-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Austria_age_earning.gph", replace
restore

** BELGIUM
use `Belgium_job_episode',replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Belgium-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Belgium_age_earning.gph", replace
restore

** DENMARK
use `Denmark_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Denmark-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Denmark_age_earning.gph", replace
restore


** GERMANY
use `Germany_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Germany-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Germany_age_earning.gph", replace
restore


** FRANCE
use `France_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(France-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\France_age_earning.gph", replace
restore


** GREECE
use `Greece_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Greece-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Greece_age_earning.gph", replace
restore


** IRELAND
use `Ireland_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Ireland-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Ireland_age_earning.gph", replace
restore


** ITALY
use `Italy_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Italy-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Italy_age_earning.gph", replace
restore

** PORTUGAL
use `Portugal_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Portugal-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Portugal_age_earning.gph", replace
restore


** NETHERLANDS
use `Netherlands_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Netherlands-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Netherlands_age_earning.gph", replace
restore


**LUXEMBOURG
use `Luxembourg_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Luxembourg-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Luxembourg_age_earning.gph", replace
restore


**SPAIN
use `Spain_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Spain-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Spain_age_earning.gph", replace
restore


**SWEDEN
use `Sweden_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Sweden-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Sweden_age_earning.gph", replace
restore


**SWITZERLAND
use `Switzerland_job_episode', replace

preserve
keep if parent_sample==2

collapse (mean)mean_w_hat=w_hat if w_hat!=. , by(age gender educ_3level) 
twoway (connected mean_w_hat age if educ_3level==1, msize(vsmall)) (connected mean_w_hat age if educ_3level==2, msize(vsmall)) (connected mean_w_hat age if educ_3level==3, msize(vsmall)), ytitle(Average log monthly wage - cpi adjusted) xtitle(Age of respondent)  by(, title(Switzerland-imputed)) legend(order( 1 "low education level" 2 "medium education level" 3 "high education level") size(small))  by(, graphregion(fcolor(white)))  by(gender)
graph save Graph "`figures'\Switzerland_age_earning.gph", replace
restore

*/

clear 

*----------------------------END OF DO FILE-------------------------------------
*-------------------------------------------------------------------------------
