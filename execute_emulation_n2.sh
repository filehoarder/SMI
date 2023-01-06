#!/usr/bin/bash

module reset
module load mpi/OpenMPI/4.1.1-GCC-10.3.0 devel/CMake/3.20.1-GCCcore-10.3.0.lua compiler/Clang/12.0.1-GCCcore-10.3.0.lua fpga/intel/opencl_sdk/18.1.1.lua fpga/bittware/520n/18.1.1_max lang/Python/3.9.5-GCCcore-10.3.0 numlib/ScaLAPACK/2.1.0-gompi-2021a-fb

cd microbenchmarks/bandwidth

env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./bandwidth_host -m emulator -k 8 -r 1 -i 1
#synthesized

cd ../bandwidth_eager

env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./bandwidth_eager_host -m emulator -k 8 -r 0 -i 1
#synthesized

cd ../broadcast

env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./broadcast_host -m emulator -n 1 -r 1 -i 1
#synthesized

cd ../gather

#env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./gather_host -m emulator -n 1 -r 1 -i 1 

cd ../injection

env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./injection_host -m emulator -n 1 -r 1 -i 1
#synthesized

cd ../latency

env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./latency_host -m emulator -n 1 -r 1 -i 1
#synthesized

cd ../multi_collectives

#env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./multi_collectives_host -m emulator -n 1 -r 1 -i 1

cd ../reduce

#env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./reduce_host -m emulator -n 2 -r 0 -i 1

cd ../scatter

#env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./scatter_host -m emulator -n 1 -r 0 -i 1

cd ../../examples/gesummv_smi

#env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 2 ./gesummv_smi_host -t emulator -n 1 -m 2 -a 1 -c 1 -r 1

cd ../stencil_smi

#env CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=8 mpirun -np 8 ./stencil_smi_host emulator 1

cd ../stencil_onchip

#does not build

