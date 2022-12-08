
TITLE "NORMALITY RESIDUAL CHECK";
proc mixed data=group_output_df;
      class school_sid / REF = FIRST ;
      model WDRAW_ORIG_YR2_RT = SY_ind AVGSTUDSENT SY_ind*AVGSTUDSENT / s corrb DDFM=SATTERTHWAITE residual outpred=output;
      random Int / type=un sub=school_sid ratios;
run; TITLE;

TITLE "NORMAL PROBABILITY PLOT AND TEST";
proc univariate data=output normaltest;
   var resid pred;
run; TITLE;
