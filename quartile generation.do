sort Totalamount
egen quartile_group = cut(Totalamount), group(4)
tabulate quartile_group
sort quartile_group
by quartile_group: summarize Totalamount

