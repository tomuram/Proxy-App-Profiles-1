#!/bin/bash
EXE=HACCKernels.thing.g++-7.2.0
RUN_PARAMETERS=
NUM_RUNS=1

# Assumes 'measurements' directory
TOT_CYCLES="-e CPUTIME -e PAPI_TOT_CYC"

ISSUE_CYCLES="-e PAPI_FUL_ICY -e PAPI_STL_ICY"

EXE_CYCLES="-e PAPI_FUL_CCY -e PAPI_STL_CCY -e PAPI_FUL_ICY"

BRANCH="-e PAPI_BR_UCN -e PAPI_BR_CN -e PAPI_BR_INS"

BRANCH_PRED="-e PAPI_BR_PRC -e PAPI_BR_MSP -e PAPI_BR_INS"

BRANCH_TAKEN="-e PAPI_BR_TKN -e PAPI_BR_NTK -e PAPI_BR_INS"

STL_RES="-e CPUTIME -e PAPI_RES_STL -e PAPI_TOT_CYC"

CACHE="-e PAPI_L1_DCM -e PAPI_L2_DCM"

MEM_INS="-e PAPI_LD_INS -e PAPI_SR_INS"

TLB="-e PAPI_TLB_DM -e PAPI_TOT_CYC"

CPI="-e PAPI_TOT_CYC -e PAPI_TOT_INS"

BRANCH_INST="-e PAPI_BR_INS"

if [ $1 = "TOT_CYCLES" ];
then
  hpcrun $TOT_CYCLES -o measurements/hpctoolkit-$EXE-measurements-TOT_CYCLES ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "ISSUE_CYCLES" ];
then
  hpcrun $ISSUE_CYCLES -o measurements/hpctoolkit-$EXE-measurements-ISSUE_CYCLES ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "EXE_CYCLES" ];
then
  hpcrun $EXE_CYCLES -o measurements/hpctoolkit-$EXE-measurements-EXE_CYCLES ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "BRANCH" ];
then
  hpcrun $BRANCH -o measurements/hpctoolkit-$EXE-measurements-BRANCH ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "BRANCH_PRED" ];
then
  hpcrun $BRANCH_PRED -o measurements/hpctoolkit-$EXE-measurements-BRANCH_PRED ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "BRANCH_TAKEN" ];
then
  hpcrun $BRANCH_TAKEN -o measurements/hpctoolkit-$EXE-measurements-BRANCH_TAKEN ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "STL_RES" ];
then
  hpcrun $STL_RES -o measurements/hpctoolkit-$EXE-measurements-STL_RES ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "CACHE" ];
then
  hpcrun $CACHE -o measurements/hpctoolkit-$EXE-measurements-CACHE ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "MEM_INS" ];
then
  hpcrun $MEM_INS -o measurements/hpctoolkit-$EXE-measurements-MEM_INS ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "TLB" ];
then
  hpcrun $TLB -o measurements/hpctoolkit-$EXE-measurements-TLB ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "CPI" ];
then
  hpcrun $CPI -o measurements/hpctoolkit-$EXE-measurements-CPI ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "BRANCH_INST" ];
then
  hpcrun $BRANCH_INST -o measurements/hpctoolkit-$EXE-measurements-BRANCH_INST ./$EXE $RUN_PARAMETERS
fi

if [ $1 = "ALL" ];
then
  hpcrun $TOT_CYCLES -o measurements/hpctoolkit-$EXE-measurements-TOT_CYCLES ./$EXE $RUN_PARAMETERS
  hpcrun $ISSUE_CYCLES -o measurements/hpctoolkit-$EXE-measurements-ISSUE_CYCLES ./$EXE $RUN_PARAMETERS
  hpcrun $EXE_CYCLES -o measurements/hpctoolkit-$EXE-measurements-EXE_CYCLES ./$EXE $RUN_PARAMETERS
  hpcrun $BRANCH -o measurements/hpctoolkit-$EXE-measurements-BRANCH ./$EXE $RUN_PARAMETERS
  hpcrun $BRANCH_PRED -o measurements/hpctoolkit-$EXE-measurements-BRANCH_PRED ./$EXE $RUN_PARAMETERS
  hpcrun $BRANCH_TAKEN -o measurements/hpctoolkit-$EXE-measurements-BRANCH_TAKEN ./$EXE $RUN_PARAMETERS
  hpcrun $STL_RES -o measurements/hpctoolkit-$EXE-measurements-STL_RES ./$EXE $RUN_PARAMETERS
  hpcrun $CACHE -o measurements/hpctoolkit-$EXE-measurements-CACHE ./$EXE $RUN_PARAMETERS
  hpcrun $MEM_INS -o measurements/hpctoolkit-$EXE-measurements-MEM_INS ./$EXE $RUN_PARAMETERS
  hpcrun $TLB -o measurements/hpctoolkit-$EXE-measurements-TLB ./$EXE $RUN_PARAMETERS
  hpcrun $CPI -o measurements/hpctoolkit-$EXE-measurements-CPI ./$EXE $RUN_PARAMETERS
  hpcrun $BRANCH_INST -o measurements/hpctoolkit-$EXE-measurements-BRANCH_INST ./$EXE $RUN_PARAMETERS
fi

# echo some info. // instead create small file with aditional information?
echo "$EXE $RUN_PARAMETERS"
echo "Number of Runs = $NUM_RUNS"
echo "Measurements: $1"
