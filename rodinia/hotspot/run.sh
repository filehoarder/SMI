#!/bin/bash
#8192x8192 input files should be generated manually using the input generator.
version=$1
#./hotspot 8192 1 2000 ../../data/hotspot/temp_8192 ../../data/hotspot/power_8192 output.txt $version
./hotspot 8000 6 100 ../../data/hotspot/temp_8192 ../../data/hotspot/power_8192 $version
