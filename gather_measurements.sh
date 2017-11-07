#!/bin/bash
EXE=
RUN_PARAMETERS=
NUM_RUNS=1

# Assumes 'measurements' directory
# Events are measued 1 by 1 with PAPI_TOT_CYC
# Add all and let fail?  Should create some groups (Are conflicts consistent across systems?)

EVENTS=(CPUTIME PAPI_L1_DCM PAPI_L2_DCM PAPI_L2_DCA PAPI_TLB_DM PAPI_TLB_IM PAPI_STL_ICY PAPI_FUL_ICY PAPI_STL_CCY PAPI_FUL_CCY PAPI_BR_UCN PAPI_BR_CN PAPI_BR_TKN PAPI_BR_NTK PAPI_BR_MSP PAPI_BR_PRC PAPI_TOT_INS PAPI_LD_INS PAPI_SR_INS PAPI_BR_INS PAPI_LST_INS PAPI_SP_OPS PAPI_DP_OPS PAPI_VEC_SP PAPI_VEC_DP)

for i in "${EVENTS[@]}"
do
  hpcrun -e $i -e PAPI_TOT_CYC -o measurements/hpctoolkit-$EXE-measurements-$i ./$EXE $RUN_PARAMETERS
done

# echo some info. // instead create small file with aditional information?
echo "$EXE $RUN_PARAMETERS"
echo "Number of Runs = $NUM_RUNS"
