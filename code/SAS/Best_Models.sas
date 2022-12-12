
/* ================================================================================================================ */
/*			Best Predictor Model																					*/
/* ================================================================================================================ */
TITLE1 "Random Quadratic Time Model -- (RANDOM SLOPES & RANDOM INTERCEPT) ~ 1";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = time1 AVGSTUDSENT time1*time1 / SOLUTION DDFM = SATTERTHWAITE;
	RANDOM INTERCEPT time1 time1*time1 / G GCORR V VCORR TYPE = UN SUBJECT = school_sid;
	REPEATED SY_ind / R TYPE = VC SUBJECT = school_sid;
	ODS OUTPUT InfoCrit = FitRandQuad;
run; TITLE1;


/* ================================================================================================================ */
/*			Best Time-only Model (Quadratic)																		*/
/* ================================================================================================================ */
TITLE1 "Random Quadratic Time Model -- (RANDOM SLOPES & RANDOM INTERCEPT) ~ 1";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = time1 time1*time1 / SOLUTION DDFM = SATTERTHWAITE;
	RANDOM INTERCEPT time1 time1*time1 / G GCORR V VCORR TYPE = UN SUBJECT = school_sid;
	REPEATED SY_ind / R TYPE = VC SUBJECT = school_sid;
	ODS OUTPUT InfoCrit = FitRandQuad;
run; TITLE1;


/* ================================================================================================================ */
/*			Best Time-only Model (Linear)																			*/
/* ================================================================================================================ */
TITLE1 "RANDOM LINEAR TIME MODEL -- (RANDOM SLOPE & RANDOM INTERCEPT)";
PROC MIXED DATA = group_output_df COVTEST NOCLPRINT NAMELEN = 100 IC METHOD = REML;
	CLASS school_sid SY_ind;
	MODEL WDRAW_ORIG_YR2_RT = time1 / SOLUTION DDFM = SATTERTHWAITE;
	RANDOM INTERCEPT time1 / G GCORR V VCORR TYPE = UN SUBJECT = school_sid;
	REPEATED SY_ind / R TYPE = VC SUBJECT = school_sid;
	ODS OUTPUT CovParms = CovRandLin InfoCrit = FitRandLin;
run; TITLE1;
