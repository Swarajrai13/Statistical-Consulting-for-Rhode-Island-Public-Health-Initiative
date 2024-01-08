  use "C:\Users\srai01\Desktop\survey datatset.dta", clear
  
 merge 1:m Loyaltycardnumber2 using "CleanPOSUniqueLoyaltycardnumber.dta"
 
 drop in 1 
 
 replace loyaltycardnumber="647" if loyaltycardnumber=="726- Under 647 in POS system"
 replace loyaltycardnumber="760" if loyaltycardnumber=="775- Under 760 in POS system"
 
 destring loyaltycardnumber, generate(Loyaltycardnumber2)
 duplicates drop Loyaltycardnumber2, force
 
 merge 1:m Loyaltycardnumber2 using "CleanPOSUniqueLoyaltycardnumber.dta"

 
 
 use "CleanPOSUniqueLoyaltycardnumber.dta", clear

 drop in 1 

replace Loyaltycardnumber = substr(Loyaltycardnumber, 6, .)
drop if Loyaltycardnumber=="045A"
destring Loyaltycardnumber, generate(Loyaltycardnumber2)
duplicates drop Loyaltycardnumber2, force

merge 1:m 


*Find out how to merge using loyaltycardnumber's last 3 digits
merge 1:m loyaltycardnumber using "C:\Users\srai01\Desktop\survey datatset.dta" 

///clear 
///import excel "C:\Users\srai01\Desktop\FOTM Survey Master Data (Student Copy).xlsx", sheet("Baseline") firstrow


///replacing food security metric with "1" for affirmative responses
gen FOOD_DIDNT_LAST1 = 0 if FOOD_DIDNT_LAST != "Sometimes, or" & FOOD_DIDNT_LAST != "Often"

replace FOOD_DIDNT_LAST1 = 1 if  FOOD_DIDNT_LAST == "Sometimes, or" | FOOD_DIDNT_LAST == "Often" 

gen BALANCED_MEALS1 = 0 if BALANCED_MEALS!= "Sometimes, or" & BALANCED_MEALS!= "Often"

replace BALANCED_MEALS1 = 1 if  BALANCED_MEALS == "Sometimes, or" | BALANCED_MEALS == "Often" 

gen SKIP_MEALS1 = 0 if SKIP_MEALS != "YES"

replace SKIP_MEALS1 = 1 if SKIP_MEALS == "YES"


gen OFTEN_SKIP_MEALS1 = 0 if OFTEN_SKIP_MEALS != "Almost every month" & OFTEN_SKIP_MEALS != "Some months but not every month, or"

replace OFTEN_SKIP_MEALS1 = 1 if OFTEN_SKIP_MEALS == "Almost every month" | OFTEN_SKIP_MEALS == "Some months but not every month, or"

gen EAT_LESS1 = 0 if EAT_LESS!= "YES"

replace EAT_LESS1 = 1 if EAT_LESS == "YES"

gen HUNGRY1 = 0 if HUNGRY != "YES"

replace HUNGRY1 = 1 if HUNGRY == "YES"

gen foodsecurityrawscore = FOOD_DIDNT_LAST1 + BALANCED_MEALS1 + SKIP_MEALS1 + OFTEN_SKIP_MEALS1 + EAT_LESS1 + HUNGRY1

replace foodsecurityrawscore = 2.86 if foodsecurity == 1
replace foodsecurityrawscore = 4.19 if foodsecurity == 2
replace foodsecurityrawscore = 5.27 if foodsecurity == 3
replace foodsecurityrawscore = 6.30 if foodsecurity == 4
replace foodsecurityrawscore = 7.54 if foodsecurity == 5
replace foodsecurityrawscore = 8.48 if foodsecurity == 6

drop if missing(StartDate)
//replace Totalamount = subinstr(Totalamount, "$", "", .)
//destring Totalamount, generate(newtotalamount) 
//su newtotalamount
su foodsecurityrawscore
su Age
tab GENDER
tab RACE
tab SCHOOL_LEVEL
tab RETIRED
tab SNAP
histogram foodsecurityrawscore, discrete percent addlabel addlabopts(mlabcolor(orange_red)) normal xlabel(#5) //Needs some work: 1) include food security level to each bar rather than percent frequency
