


//NSS 76th round WASH//

//Open Level 05 for WASH//


g state= substr(NSS_Region,1,2)
destring state,replace
keep if state== 19|state==11|state==17|state==01|state==02 //To keep only high incidence states //
//01: J & K- 3.86, 02 :HP- 4.16, 17:Meghalaya - 4.34, 11:Sikkim - 6.2, 19: West Bengal - 6.5

*DRINKING WATER*

//Improved source of drinking water
destring source_drinking_water, replace
recode source_drinking_water (1 2 3 4 5 6 7 8 10 11 12 14=1 "Improved Water") (else = 2 "Unimproved Water"), g(improved_water) 

// For access of drinking water
destring Access_source_water, replace
recode Access_source_water (1=1 "exclusive use of household") (2=2 "common use of household") (3=3 "neighbour's source") (4/7=4 "community use") (9=5 "others"), g(access_dw) 
g wht= Multiplier/100
destring Sector, replace
recode Sector (1=1 "Rural") (2=2 "Urban"), g(sector)

//Tabulating access of drinking water and improved water to sector
tab access_dw sector [iw=wht], col nof 
tab improved_water sector [iw=wht], col nof


//Exclusive Access to improved source of  drinking water
egen accesstoimprovedwater =group(improved_water access_dw )

   

 //Distance to drinking water
destring Distance_source_water, replace
recode Distance_source_water (1=1 "within dwelling") ( 2=2 "outside dwelling but within the premises") (3/7=3 "Outside premises") (.=.), g(distance_dw)
tab distance_dw sector [iw=wht], col nof

//Households having sufficient drinking water throughout the year from principal source of drinking water
gen sufficient_from_principal = .
destring water_sufficient_drink,replace
replace sufficient_from_principal = 1 if water_sufficient_drink == 1 & source_drinking_water != .
replace sufficient_from_principal = 0 if water_sufficient_drink == 2 & source_drinking_water != .
table sector if sufficient_from_principal==1 [iw=wht], format (%20.0f) row
table sector[iw=wht], format (%20.0f) row





*Sanitation- Toilets*

//Access of households to toilets
destring Access_latrine, replace
recode Access_latrine (1=1 "Exclusive use") (2=2 "Common Use") (3/4=3 "Community use") (9=4 "Others") (5=5 "No Access"), g (access_toilet)
tab access_toilet sector [iw=wht], col nof

//Type of toilets 
destring latrine_type, replace
recode latrine_type (1 2 3 4 6 7 10 =1 "Improved_Toilet") (5 8 11 19= 2 "Unimproved_Toilet") (.=.), g(improved_toilet)
tab improved_toilet sector [iw=wht], col nof



//Exclusive Access to improved toilets 
egen accesstoimprovedtoilets =group(improved_toilet access_toilet )


*Hygiene*

//Practise of Hand washing
destring wash_hand_after_defecation, replace
recode wash_hand_after_defecation (1=1 "With water and soap/detergent") (2=2 "With water and ash/mud/sand etc") (3=3 "with water only") (4=4 "Do not wash hands") , g(wash_hands)
tab wash_hands sector [iw=wht],col nof







//NSS 79th round WASH//

//Open Household data//
g state= substr(NSS,1,2)
destring state,replace
keep if state== 19|state==11|state==17|state==01|state==02 //To keep only high incidence states



*DRINKING WATER*

//Improved source of drinking water
destring BL41I5, replace
recode BL41I5 (1 2 3 4 5 6 7 8 10 11 12 14=1 "Improved Water") (else = 2 "Unimproved Water"), g(improved_water) 
g wht= MULT/100
destring SEC, replace
recode SEC (1=1 "Rural") (2=2 "Urban"), g(sector)

//Tabulating improved water to sector
tab improved_water sector [iw=wht], col nof

// For access of drinking water
destring BL41I7, replace
recode BL41I7 (1=1 "exclusive use of household") (2=2 "common use of household") (3=3 "neighbour's source") (4=4 "community use") (9=5 "others"), g(access_dw)

//Tabulating access of drinking water to sector
tab access_dw sector [iw=wht], col nof



//Exclusive Access to improved source of  drinking water
egen accesstoimprovedwater =group(improved_water access_dw )


//Distance to drinking water
destring BL41I8, replace
recode BL41I8 (1=1 "within dwelling") ( 2=2 "outside dwelling but within the premises") (3=3 "Outside premises") (.=.), g(distance_dw)
tab distance_dw sector [iw=wht], col nof


//Households having sufficient drinking water throughout the year from principal source of drinking water
gen sufficient_from_principal = .
destring BL41I6,replace
replace sufficient_from_principal = 1 if BL41I6 == 1 & BL41I5 != .
replace sufficient_from_principal = 0 if BL41I6 == 2 & BL41I5 != .
table sector if sufficient_from_principal==1 [iw=wht], format (%20.0f) row
table sector[iw=wht], format (%20.0f) row


*Sanitation- Toilets*

//Access of households to toilets
destring BL41I10, replace
recode BL41I10 (1=1 "Exclusive use") (2=2 "Common Use") (3=3 "Community use") (9=4 "Others") (4=5 "No Access"), g (access_toilet)
tab access_toilet sector [iw=wht], col nof



//Type of toilets 
destring BL41I11, replace
recode BL41I11 (1 2 3 4 6 7 10 =1 "Improved_Toilet") (5 8 11 19= 2 "Unimproved_Toilet") (.=.), g(improved_toilet)
tab improved_toilet sector [iw=wht], col nof


//Exclusive Access to improved toilets 
egen accesstoimprovedtoilets =group(improved_toilet access_toilet )


*Hygiene*

//Practise of Hand washing
destring BL41I12, replace
recode BL41I12 (1=1 "With water and soap/detergent") (2=2 "With water and ash/mud/sand etc") (3=3 "with water only") (4=4 "Do not wash hands") , g(wash_hands)
tab wash_hands sector [iw=wht],col nof










//All states individual WASH indicators - 76th
   *Exclusive Access to improved source of drinking water*
tab accesstoimprovedwater sector if state==01 [iw=wht], col nof  //Refer first row for exclusive access to improved water
tab accesstoimprovedwater sector if state==02 [iw=wht], col nof
tab accesstoimprovedwater sector if state==11 [iw=wht], col nof
tab accesstoimprovedwater sector if state==17 [iw=wht], col nof
tab accesstoimprovedwater sector if state==19 [iw=wht], col nof


	*Exclusive Access to improved toilets*
tab accesstoimprovedtoilets sector if state==01 [iw=wht], col nof
tab accesstoimprovedtoilets sector if state==02 [iw=wht], col nof
tab accesstoimprovedtoilets sector if state==11 [iw=wht], col nof
tab accesstoimprovedtoilets sector if state==17 [iw=wht], col nof
tab accesstoimprovedtoilets sector if state==19 [iw=wht], col nof
	
	*Hand washing facility*
	tab wash_hands sector if state==01 [iw=wht],col nof
	tab wash_hands sector if state==02 [iw=wht],col nof
	tab wash_hands sector if state==11 [iw=wht],col nof
	tab wash_hands sector if state==17 [iw=wht],col nof
	tab wash_hands sector if state==19 [iw=wht],col nof



	
	
	//All states individual WASH indicators - 79th
   *Exclusive Access to improved source of drinking water*
tab accesstoimprovedwater sector if state==01 [iw=wht], col nof	
tab accesstoimprovedwater sector if state==02 [iw=wht], col nof	
tab accesstoimprovedwater sector if state==11 [iw=wht], col nof	
tab accesstoimprovedwater sector if state==17 [iw=wht], col nof	
tab accesstoimprovedwater sector if state==19 [iw=wht], col nof
	
	
	*Exclusive Access to improved toilets*
tab accesstoimprovedtoilets sector if state==01 [iw=wht], col nof
tab accesstoimprovedtoilets sector if state==02 [iw=wht], col nof
tab accesstoimprovedtoilets sector if state==11 [iw=wht], col nof
tab accesstoimprovedtoilets sector if state==17 [iw=wht], col nof
tab accesstoimprovedtoilets sector if state==19 [iw=wht], col nof	
	
	
	*Hand washing facility*
tab wash_hands sector if state==01 [iw=wht],col nof
tab wash_hands sector if state==02 [iw=wht],col nof	
tab wash_hands sector if state==11 [iw=wht],col nof
tab wash_hands sector if state==17 [iw=wht],col nof
tab wash_hands sector if state==19 [iw=wht],col nof
