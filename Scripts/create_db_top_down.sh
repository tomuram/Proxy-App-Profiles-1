#!/bin/bash
EXE=HACCKernels.thing.g++-7.2.0
# Assumes 'databases' directory and measurements in 'measurements' directory
# Need to Ajust -I argument

# TOP_LEVEL (Total Instructions, Time and Total Cycles
# ISSUE (Instruction Issuing Cycle Info)
# EXEC (Instrunction Retiring Cycle and Resource Stall Info)
# BRANCH (Conditional Branch Information)
# CACHE (Data Cache Misses and Memory Instructions)
# TLB (Translation Buffer Misses)
# INST ( Total Cycles, Total Instructions, Branch Instructions and Load/Store Instructions

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-CPI)
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-TOT_CYCLES"
hpcprof -S ${EXE}.hpcstruct -I ./"'+'" -o databases/hpctoolkit-$EXE-database-TOP_LEVEL $MEASUREMENTS


MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-ISSUE_CYCLES)
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-TOT_CYCLES"
hpcprof -S ${EXE}.hpcstruct -I ./"'+'" -o databases/hpctoolkit-$EXE-database-ISSUE $MEASUREMENTS

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-EXE_CYCLES)
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-STL_RES"
hpcprof -S ${EXE}.hpcstruct -I ./"'+'" -o databases/hpctoolkit-$EXE-database-EXEC $MEASUREMENTS

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-BRANCH)
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-BRANCH_PRED"
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-BRANCH_TAKEN"
hpcprof -S ${EXE}.hpcstruct -I ./"'+'" -o databases/hpctoolkit-$EXE-database-BRANCH $MEASUREMENTS

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-CACHE)
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-MEM_INS"
hpcprof -S ${EXE}.hpcstruct -I ./"'+'" -o databases/hpctoolkit-$EXE-database-CACHE $MEASUREMENTS

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-TLB)
hpcprof -S ${EXE}.hpcstruct -I ./"'+'" -o databases/hpctoolkit-$EXE-database-TLB $MEASUREMENTS

MEASUREMENTS=(measurements/hpctoolkit-$EXE-measurements-BRANCH_INST)
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-TOT_CYCLES"
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-MEM_INS"
MEASUREMENTS+=" measurements/hpctoolkit-$EXE-measurements-CPI"
hpcprof -S ${EXE}.hpcstruct -I ./"'+'" -o databases/hpctoolkit-$EXE-database-INST $MEASUREMENTS
