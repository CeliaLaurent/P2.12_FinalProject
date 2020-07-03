MPIranks=2
Nrow_cols=6000
Nt=2000
Copt='-Ofast-marchnative-mavx2_noimgwritting' 
CASE=np${MPIranks}_rowscols${Nrow_cols}_NT${Nt}_COPT${Copt}
mpirun -np ${MPIranks} aps  -r=aps_${CASE} ../src/heat_mpi_${Copt} ${Nrow_cols} ${Nrow_cols} ${Nt}
aps-report -a -O aps_${CASE}.html aps_${CASE}
rm heat*.png
rm HEAT_RESTART.dat

MPIranks=4
Nrow_cols=2000
Nt=500
Copt='-Ofast-marchnative-mavx2_noimgwritting' 
CASE=np${MPIranks}_rowscols${Nrow_cols}_NT${Nt}_COPT${Copt}
mpirun -np ${MPIranks} aps  -r=aps_${CASE} ../src/heat_mpi_${Copt} ${Nrow_cols} ${Nrow_cols} ${Nt}
aps-report -a -O aps_${CASE}.html aps_${CASE}
rm heat*.png
rm HEAT_RESTART.dat

MPIranks=4
Nrow_cols=6000
Nt=5000
Copt='-Ofast-marchnative-mavx2_noimgwritting' 
CASE=np${MPIranks}_rowscols${Nrow_cols}_NT${Nt}_COPT${Copt}
mpirun -np ${MPIranks} aps  -r=aps_${CASE} ../src/heat_mpi_${Copt} ${Nrow_cols} ${Nrow_cols} ${Nt}
aps-report -a -O aps_${CASE}.html aps_${CASE}
rm heat*.png
rm HEAT_RESTART.dat

MPIranks=4
Nrow_cols=6000
Nt=2000
for Copt in '' 'noimgwritting' '-marchnative_noimgwritting' '-marchnative-mavx2_noimgwritting' '-mavx2_noimgwritting' '-Ofast-marchnative_noimgwritting' '-Ofast-marchnative-mavx2_noimgwritting' ; do
  CASE=np${MPIranks}_rowscols${Nrow_cols}_NT${Nt}_COPT${Copt}
  mpirun -np ${MPIranks} aps  -r=aps_${CASE} ../src/heat_mpi_${Copt} ${Nrow_cols} ${Nrow_cols} ${Nt}
  aps-report -a -O aps_${CASE}.html aps_${CASE}
  rm heat*.png
  rm HEAT_RESTART.dat
done
