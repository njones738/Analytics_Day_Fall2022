TITLE1 "SATURATED MEANS, UNSTRUCTURED VARIANCE MODEL -- (BEST CASE)";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = SY_ind AVGSTUDSENT SY_ind*AVGSTUDSENT / SOLUTION DDFM = SATTERTHWAITE;
	REPEATED SY_ind / R RCORR TYPE = UN SUBJECT = school_sid;
	LSMEANS SY_ind / DIFF = ALL;
run; TITLE1;

/* ================================================================================================================ */

TITLE1 "EMPTY MEANS, RANDOM INTERCEPT MODEL -- (WORST BASELINE CASE)";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = AVGSTUDSENT / SOLUTION DDFM = SATTERTHWAITE;
	RANDOM INTERCEPT / G V VCORR TYPE = UN SUBJECT = school_sid;
	REPEATED SY_ind / R RCORR TYPE = VC SUBJECT = school_sid;
	ODS OUTPUT CovParms = CovEmpty;
run; TITLE1;

/* ================================================================================================================ */

TITLE1 "FIXED LINEAR TIME, RANDOM INTERCEPT MODEL -- (FIXED SLOPE & RANDOM INTERCEPT)";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = time1 AVGSTUDSENT / SOLUTION DDFM = SATTERTHWAITE;
	RANDOM INTERCEPT / G V VCORR TYPE = UN SUBJECT = school_sid;
	REPEATED SY_ind / R TYPE = VC SUBJECT = school_sid;
	ODS OUTPUT CovParms = CovFixLin InfoCrit = FitFixLin;
	ESTIMATE "Intercept at School Year = 0 ~ Time = 0"	intercept 1 time1 0;
	ESTIMATE "Intercept at School Year = 1 ~ Time = 1"	intercept 1 time1 1;
	ESTIMATE "Intercept at School Year = 2 ~ Time = 2"	intercept 1 time1 2;
	ESTIMATE "Intercept at School Year = 3 ~ Time = 3"	intercept 1 time1 3;
	ESTIMATE "Intercept at School Year = 4 ~ Time = 4"	intercept 1 time1 4;
	ESTIMATE "Intercept at School Year = 5 ~ Time = 5"	intercept 1 time1 5;
	ESTIMATE "Intercept at School Year = 6 ~ Time = 6"	intercept 1 time1 6;
	ESTIMATE "Intercept at School Year = 7 ~ Time = 7"	intercept 1 time1 7;
	ESTIMATE "Intercept at School Year = 8 ~ Time = 8"	intercept 1 time1 8;
	ESTIMATE "Intercept at School Year = 9 ~ Time = 9"	intercept 1 time1 9;
	ESTIMATE "Intercept at School Year = 10 ~ Time = 10"	intercept 1 time1 10;
	ESTIMATE "Intercept at School Year = 11 ~ Time = 11"	intercept 1 time1 11;
	ESTIMATE "Intercept at School Year = 12 ~ Time = 12"	intercept 1 time1 12;
	ESTIMATE "Intercept at School Year = 13 ~ Time = 13"	intercept 1 time1 13;
	ESTIMATE "Intercept at School Year = 14 ~ Time = 14"	intercept 1 time1 14;
	ESTIMATE "Intercept at School Year = 15 ~ Time = 15"	intercept 1 time1 15;
	ESTIMATE "Intercept at School Year = 16 ~ Time = 16"	intercept 1 time1 16;
	ESTIMATE "Intercept at School Year = 17 ~ Time = 17"	intercept 1 time1 17;
run; TITLE1;

/* ================================================================================================================ */

TITLE1 "RANDOM LINEAR TIME MODEL -- (RANDOM SLOPE & RANDOM INTERCEPT)";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = time1 AVGSTUDSENT / SOLUTION DDFM = SATTERTHWAITE;
	RANDOM INTERCEPT time1 / G GCORR V VCORR TYPE = UN SUBJECT = school_sid;
	REPEATED SY_ind / R TYPE = VC SUBJECT = school_sid;
	ODS OUTPUT CovParms = CovRandLin InfoCrit = FitRandLin;
run; TITLE1;

/* ================================================================================================================ */

TITLE1 "Fixed Quadratic, Random Linear Time Model -- (FIXED QUADRATIC SLOPE &RANDOM LINEAR SLOPE & RANDOM INTERCEPT)";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = time1 AVGSTUDSENT time1*time1 / SOLUTION DDFM = SATTERTHWAITE;
	RANDOM INTERCEPT time1 / G GCORR V VCORR TYPE = UN SUBJECT = school_sid;
	REPEATED SY_ind / R TYPE = VC SUBJECT = school_sid;
	ODS OUTPUT CovParms = CovFixQuad InfoCrit = FitFixQuad;
	ESTIMATE "Intercept at School Year = 0 ~ Time = 0" intercept 1 time1 0 time1 * time1 0;
	ESTIMATE "Intercept at School Year = 1 ~ Time = 1" intercept 1 time1 1 time1 * time1 1;
	ESTIMATE "Intercept at School Year = 2 ~ Time = 2" intercept 1 time1 2 time1 * time1 4;
	ESTIMATE "Intercept at School Year = 3 ~ Time = 3" intercept 1 time1 3 time1 * time1 9;
	ESTIMATE "Intercept at School Year = 4 ~ Time = 4" intercept 1 time1 4 time1 * time1 16;
	ESTIMATE "Intercept at School Year = 5 ~ Time = 5" intercept 1 time1 5 time1 * time1 25;
	ESTIMATE "Intercept at School Year = 6 ~ Time = 6" intercept 1 time1 6 time1 * time1 36;
	ESTIMATE "Intercept at School Year = 7 ~ Time = 7" intercept 1 time1 7 time1 * time1 49;
	ESTIMATE "Intercept at School Year = 8 ~ Time = 8" intercept 1 time1 8 time1 * time1 64;
	ESTIMATE "Intercept at School Year = 9 ~ Time = 9" intercept 1 time1 9 time1 * time1 81;
	ESTIMATE "Intercept at School Year = 10 ~ Time = 10" intercept 1 time1 10 time1 * time1 100;
	ESTIMATE "Intercept at School Year = 11 ~ Time = 11" intercept 1 time1 11 time1 * time1 121;
	ESTIMATE "Intercept at School Year = 12 ~ Time = 12" intercept 1 time1 12 time1 * time1 144;
	ESTIMATE "Intercept at School Year = 13 ~ Time = 13" intercept 1 time1 13 time1 * time1 169;
	ESTIMATE "Intercept at School Year = 14 ~ Time = 14" intercept 1 time1 14 time1 * time1 196;
	ESTIMATE "Intercept at School Year = 15 ~ Time = 15" intercept 1 time1 15 time1 * time1 225;
	ESTIMATE "Intercept at School Year = 16 ~ Time = 16" intercept 1 time1 16 time1 * time1 256;
	ESTIMATE "Intercept at School Year = 17 ~ Time = 17" intercept 1 time1 17 time1 * time1 289;
	ESTIMATE "Linear Slope at School Year = 0 ~ Time = 0" time1 1 time1 0 time1 * time1 0;
	ESTIMATE "Linear Slope at School Year = 1 ~ Time = 1" time1 1 time1 1 time1 * time1 2;
	ESTIMATE "Linear Slope at School Year = 2 ~ Time = 2" time1 1 time1 2 time1 * time1 4;
	ESTIMATE "Linear Slope at School Year = 3 ~ Time = 3" time1 1 time1 3 time1 * time1 6;
	ESTIMATE "Linear Slope at School Year = 4 ~ Time = 4" time1 1 time1 4 time1 * time1 8;
	ESTIMATE "Linear Slope at School Year = 5 ~ Time = 5" time1 1 time1 5 time1 * time1 10;
	ESTIMATE "Linear Slope at School Year = 6 ~ Time = 6" time1 1 time1 6 time1 * time1 12;
	ESTIMATE "Linear Slope at School Year = 7 ~ Time = 7" time1 1 time1 7 time1 * time1 14;
	ESTIMATE "Linear Slope at School Year = 8 ~ Time = 8" time1 1 time1 8 time1 * time1 16;
	ESTIMATE "Linear Slope at School Year = 9 ~ Time = 9" time1 1 time1 9 time1 * time1 18;
	ESTIMATE "Linear Slope at School Year = 10 ~ Time = 10" time1 1 time1 10 time1 * time1 20;
	ESTIMATE "Linear Slope at School Year = 11 ~ Time = 11" time1 1 time1 11 time1 * time1 22;
	ESTIMATE "Linear Slope at School Year = 12 ~ Time = 12" time1 1 time1 12 time1 * time1 24;
	ESTIMATE "Linear Slope at School Year = 13 ~ Time = 13" time1 1 time1 13 time1 * time1 26;
	ESTIMATE "Linear Slope at School Year = 14 ~ Time = 14" time1 1 time1 14 time1 * time1 28;
	ESTIMATE "Linear Slope at School Year = 15 ~ Time = 15" time1 1 time1 15 time1 * time1 30;
	ESTIMATE "Linear Slope at School Year = 16 ~ Time = 16" time1 1 time1 16 time1 * time1 32;
	ESTIMATE "Linear Slope at School Year = 17 ~ Time = 17" time1 1 time1 17 time1 * time1 34;
run; TITLE1;

/* ================================================================================================================ */

TITLE1 "Random Quadratic Time Model -- (RANDOM SLOPES & RANDOM INTERCEPT) ~ 1";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = time1 AVGSTUDSENT time1*time1 / SOLUTION DDFM = SATTERTHWAITE;
	RANDOM INTERCEPT time1 time1*time1 / G GCORR V VCORR TYPE = UN SUBJECT = school_sid;
	REPEATED SY_ind / R TYPE = VC SUBJECT = school_sid;
	ODS OUTPUT InfoCrit = FitRandQuad;
run; TITLE1;

