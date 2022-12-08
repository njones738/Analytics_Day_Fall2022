/* ================================================================================================================ */

/* IMPORT IMPORT DATASET */
proc import
	datafile = 'N:/Classes/2022_2FALL/Analytics Day/Code/group_output_df4.csv'
	out = work.group_output_df
	dbms = CSV; run;
proc contents data = work.group_output_df; run;

/* ================================================================================================================ */

/* SET TIME DUMMIES */
data work.group_output_df;
	set work.group_output_df;
	time1 = SY_ind - 1; LABEL time1 = "time1: SY_ind (0 = 1)";
	IF SY_ind = 0 THEN s1 = 0; ELSE s1 = 0;
	IF SY_ind = 1 THEN s1 = 1; ELSE s1 = 0;
	IF SY_ind = 2 THEN s1 = 2; ELSE s1 = 0;
	IF SY_ind = 3 THEN s1 = 3; ELSE s1 = 0;
	IF SY_ind = 4 THEN s1 = 4; ELSE s1 = 0;
	IF SY_ind = 5 THEN s1 = 5; ELSE s1 = 0;
	IF SY_ind = 6 THEN s1 = 6; ELSE s1 = 0;
	IF SY_ind = 7 THEN s1 = 7; ELSE s1 = 0;
	IF SY_ind = 8 THEN s1 = 8; ELSE s1 = 0;
	IF SY_ind = 9 THEN s1 = 9; ELSE s1 = 0;
	IF SY_ind = 10 THEN s1 = 10; ELSE s1 = 0;
	IF SY_ind = 11 THEN s1 = 11; ELSE s1 = 0;
	IF SY_ind = 12 THEN s1 = 12; ELSE s1 = 0;
	IF SY_ind = 13 THEN s1 = 13; ELSE s1 = 0;
	IF SY_ind = 14 THEN s1 = 14; ELSE s1 = 0;
	IF SY_ind = 15 THEN s1 = 15; ELSE s1 = 0;
	IF SY_ind = 16 THEN s1 = 16; ELSE s1 = 0;
	IF SY_ind = 17 THEN s1 = 17; ELSE s1 = 0;

	AVGSTUDSENT_LABEL = "NEUTRAL";
	IF AVGSTUDSENT < 0.5 THEN AVGSTUDSENT_LABEL = "NEGATIVE";
	IF AVGSTUDSENT > 0.75 THEN AVGSTUDSENT_LABEL = "POSITIVE";
run;

proc freq data = work.group_output_df;
	tables AVGSTUDSENT_LABEL;
run;

/* ================================================================================================================ */

/* MEANS */
TITLE1 "Mean of Withdrawal Rate by School Year";
proc means
		data = group_output_df 
		median 
		mean 
		var;
	CLASS SY_ind; WAYS 0 1;
	VAR WDRAW_ORIG_YR2_RT;
run; TITLE1;

/* ================================================================================================================ */

/* SPAGHETTI PLOT */
TITLE1 "Spaghetti Plot of Withdrawal Rate";
proc sgplot
		data = group_output_df;
	series 
		y = WDRAW_ORIG_YR2_RT
		x = SY_ind / group = school_sid;
	title 'Spaghetti Plot of Withdrawal Rate';
run; TITLE;

/* ================================================================================================================ */






