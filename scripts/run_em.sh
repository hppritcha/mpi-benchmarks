#!/bin/bash -f

NAMES="Allreduce Allgather Alltoall"
for name in $NAMES
do
    echo $name.lengths
    mpirun -np 4 ../src_c/IMB-MPI1 -msglen $name.lengths $name
done
#
# barrier is a special case with no lengths
mpirun -np 4 ../src_c/IMB-MPI1 Barrier
