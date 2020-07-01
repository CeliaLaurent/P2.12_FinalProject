MPIranks=2
Nrow_cols=6000
Nt=2000
#Version='origin'
#Version='restrict'
Version='restrict_opti2'
#for Version in 'origin' 'restrict' 'restrict_opti' ; do
  CASE=np${MPIranks}_rowscols${Nrow_cols}_NT${Nt}_${Version}
  mpirun -np 2 advixe-cl -collect survey -collect tripcounts -collect map -collect dependencies -no-auto-finalize -project-dir ./adv_${CASE}  --search-dir src:r=../src/${Version}  ../src/${Version}/heat_mpi
  rm HEAT_RESTART.dat
  rm heat*.png
  advixe-cl --snapshot --project-dir ./adv_${CASE} --pack --cache-sources --cache-binaries   --search-dir src:r=../src/${Version}/ -- ./adv_${CASE}
  echo ' now run "advixe-gui adv_${CASE}.advixeexpz" '
  echo ' --------------------------------------------------------------------------'
#done
