#!/bin/bash
EXE=

# Grouped for Viewing

DATA_CACHE=(PAPI_L1_DCM PAPI_L2_DCM PAPI_L2_DCA PAPI_LD_INS PAPI_SR_INS PAPI_LST_INS PAPI_TLB_DM PAPI_TLB_IM)

BRANCH=(PAPI_BR_UCN PAPI_BR_CN PAPI_BR_TKN PAPI_BR_NTK PAPI_BR_MSP PAPI_BR_PRC PAPI_BR_INS)

CYCLES=(PAPI_STL_ICY PAPI_FUL_ICY PAPI_TOT_CYC PAPI_STL_CCY PAPI_FUL_CCY)

INST=(PAPI_TOT_INS PAPI_LD_INS PAPI_SR_INS PAPI_BR_INS PAPI_LST_INS PAPI_DP_OPS PAPI_VEC_DP)

# Assumes 'databases' directory and measurements in 'measurements' directory
# Need to Ajust -I argument

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-CPUTIME)
for i in "${DATA_CACHE[@]}"
do 
  MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-$i"
done
hpcprof -S ${EXE}.hpcstruct -I ../"'+'" -o databases/hpctoolkit-$EXE-database-DATA_CACHE $MEASUREMENTS


MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-CPUTIME)
for i in "${BRANCH[@]}"
do
  MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-$i"
done
hpcprof -S ${EXE}.hpcstruct -I ../"'+'" -o databases/hpctoolkit-$EXE-database-BRANCH $MEASUREMENTS

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-CPUTIME)
for i in "${CYCLES[@]}"
do
  MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-$i"
done
hpcprof -S ${EXE}.hpcstruct -I ../"'+'" -o databases/hpctoolkit-$EXE-database-CYCLES $MEASUREMENTS

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-CPUTIME)
for i in "${INST[@]}"
do
  MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-$i"
done
hpcprof -S ${EXE}.hpcstruct -I ../"'+'" -o databases/hpctoolkit-$EXE-database-INST $MEASUREMENTS


