use "final merged dataset.dta", clear


//Creation of food security var (DV)
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

drop if Totalamount==. //drop missing entries of main IV

drop FS FR FT FU FV FQ FP FO FN FM //drop missing vars

drop Q152 Q129_1_TEXT Q129_2_TEXT Q129_3_TEXT Q131_2_TEXT Q131_3_TEXT //drop missing vars

drop in 175/772 //Drop missing obs