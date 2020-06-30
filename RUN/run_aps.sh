MPIranks=2
#numrowscols=2000                          # 1.a)
#numtimesteps=500                          # 1.a)
numrowscols=100                         # 1.b-e)
numtimesteps=500                        # 1.b-e)
#Copt=''                                   # 1.a) and 1.b)
#Copt='noimgwritting'                    # 1.c)
#Copt='-marchnative_noimgwritting'        # 1.d)
#Copt='-Ofast-marchnative_noimgwritting'  # 1.e) ?
Copt='-mavx2_noimgwritting'  # 1.e) ?
Copt='-marchnative-mavx2_noimgwritting'  # 1.e) ?
Copt='-Ofast-marchnative-mavx2_noimgwritting'  # 1.e) ?
export MPS_STAT_LEVEL=4
case=np${MPIranks}_rowscols${numrowscols}_NT${numtimesteps}_COPT${Copt}
echo "mpirun -np ${MPIranks} aps  -r=aps_results_${case}  ../src/heat_mpi_${Copt} ${numrowscols} ${numrowscols} ${numtimesteps}" 
mpirun -np ${MPIranks} aps  -r=aps_results_${case}  ../src/heat_mpi_${Copt} ${numrowscols} ${numrowscols} ${numtimesteps}
aps-report -O aps_results_${case}.summary.html aps_results_${case}
for opt in a o f t u ; do # c m x r l 
  aps-report -${opt} -O aps_results_${case}.-${opt}.html aps_results_${case} > aps_results_${case}.-${opt}.out
done
mkdir aps_${case} 
mv aps_results_${case}* aps_${case}/.

rm *.png
rm HEAT_RESTART.dat 
