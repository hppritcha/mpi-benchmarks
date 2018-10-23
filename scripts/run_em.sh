#!/bin/bash -f

NAMES="Allreduce Allgather Alltoall"
NRANKS=4
for name in $NAMES
do
    echo $name.lengths
    mpirun -np $NRANKS ../src_c/IMB-MPI1 -npmin $NRANKS -msglen $name.lengths $name
done
#
# barrier is a special case with no lengths
mpirun -np $NRANKS ../src_c/IMB-MPI1 -npmin $NRANKS Barrier
