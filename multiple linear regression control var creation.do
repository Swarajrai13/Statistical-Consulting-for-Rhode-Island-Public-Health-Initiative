destring HHLD_SIZE_0_TEXT, gen(HHLD_SIZE_NUM)

gen SCHOOL_LEVEL_NUM = SCHOOL_LEVEL

replace SCHOOL_LEVEL_NUM = "0" if SCHOOL_LEVEL_NUM == "LESS THAN HIGH SCHOOL DEGREE"
replace SCHOOL_LEVEL_NUM = "1" if SCHOOL_LEVEL_NUM == "HIGH SCHOOL DEGREE OR EQUIVALENT (e.g. GED)"
replace SCHOOL_LEVEL_NUM = "2" if SCHOOL_LEVEL_NUM == "COLLEGE DEGREE OR MORE"
**# Bookmark #1
replace SCHOOL_LEVEL_NUM = "." if SCHOOL_LEVEL_NUM == "OTHER (Please Describe)" | SCHOOL_LEVEL_NUM == "DON'T KNOW"
replace SCHOOL_LEVEL_NUM = "." if SCHOOL_LEVEL_NUM == "DON'T KNOW"

** Retired variable creation
gen RETIRED_NUM = RETIRED

replace RETIRED_NUM = "0" if RETIRED_NUM == "YES"
replace RETIRED_NUM = "1" if RETIRED_NUM == "NO"
replace RETIRED_NUM = "." if RETIRED_NUM == "DON'T KNOW"


destring RETIRED_NUM, gen(RETIRED_NUM2)

** Fruit variable creation
gen FRUIT_NUM = FRUIT

replace FRUIT_NUM = "0" if FRUIT_NUM == "NEVER"
replace FRUIT_NUM = "1" if FRUIT_NUM == "Per month"
replace FRUIT_NUM = "2" if FRUIT_NUM == "Per week"
replace FRUIT_NUM = "3" if FRUIT_NUM == "Per day" | FRUIT_NUM == "PER DAY"
replace FRUIT_NUM = "." if FRUIT_NUM == "DON'T KNOW"
replace FRUIT_NUM = "." if FRUIT_NUM == "REFUSED"

destring FRUIT_NUM, gen(FRUIT_NUM2)



** veg variable creation
gen VEG_DARK_GREEN_NUM = VEG_DARK_GREEN

replace VEG_DARK_GREEN_NUM = "0" if VEG_DARK_GREEN_NUM == "NEVER"
replace VEG_DARK_GREEN_NUM = "1" if VEG_DARK_GREEN_NUM == "Per month"
replace VEG_DARK_GREEN_NUM = "2" if VEG_DARK_GREEN_NUM == "Per week"
replace VEG_DARK_GREEN_NUM = "3" if VEG_DARK_GREEN_NUM == "Per day" | VEG_DARK_GREEN_NUM == "PER DAY"
replace VEG_DARK_GREEN_NUM = "." if VEG_DARK_GREEN_NUM == "DON'T KNOW"
replace VEG_DARK_GREEN_NUM = "." if VEG_DARK_GREEN_NUM == "REFUSED"

destring VEG_DARK_GREEN_NUM, gen(VEG_DARK_GREEN_NUM2)


gen phys_act_days_num = phys_act_days
replace phys_act_days_num = "0" if phys_act_days_num == "0 or No days"
replace phys_act_days_num = "1" if phys_act_days_num == "1 day"
replace phys_act_days_num = "2" if phys_act_days_num == "2 days"
replace phys_act_days_num = "3" if phys_act_days_num == "3 days"
replace phys_act_days_num = "4" if phys_act_days_num == "4 days"
replace phys_act_days_num = "5" if phys_act_days_num == "5 days"
replace phys_act_days_num = "6" if phys_act_days_num == "6 days"
replace phys_act_days_num = "7" if phys_act_days_num == "7 days"

destring phys_act_days_num, gen(phys_act_days_num2)







