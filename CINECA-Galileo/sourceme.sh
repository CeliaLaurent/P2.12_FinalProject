module purge
#
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/galileo/home/userexternal/clauren1/opt/mylibs/libpng-1.6.37/lib
#
module load intel/pe-xe-2018--binary
module load intelmpi/2018--binary
#
module load vtune/2018 
export PATH=$PATH:/cineca/prod/opt/compilers/intel/pe-xe-2018/binary/advisor/bin64/
export PATH=$PATH:/cineca/prod/opt/compilers/intel/pe-xe-2018/binary/vtune_amplifier/bin64
source /cineca/prod/opt/compilers/intel/pe-xe-2018/binary/vtune_amplifier/amplxe-vars.sh
