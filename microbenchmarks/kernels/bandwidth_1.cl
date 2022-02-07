/**
    Scaling benchmark: we want to evaluate the bandwdith
    achieved between two ranks. The FPGA are connected in a chain
    so we can decide the distance at which they are

    RANK 0 is the source of the data
*/


#include <smi.h>

#include "smi_generated_device.cl"

__kernel void app(__global char *mem, const int N, SMI_Comm comm)
{
    SMI_Channel chan=SMI_Open_receive_channel_ad(N, SMI_DOUBLE, 0, 0, comm, 2048);
    const double start=0.1f;
    char check=1;
    for(int i=0;i<N;i++)
    {

        double rcvd;
        SMI_Pop(&chan,&rcvd);

        check &= (rcvd==(start+i));
    }
    *mem=check;

}

__kernel void app_1(__global char *mem, const int N,SMI_Comm comm)
{
    SMI_Channel chan=SMI_Open_receive_channel_ad(N, SMI_DOUBLE, 0, 1, comm, 2048);
    const double start=0.1f;
    char check=1;

    for(int i=0;i<N;i++)
    {

        double rcvd;
        SMI_Pop(&chan,&rcvd);

        check &= (rcvd==(start+i));
    }
    *mem=check;

}
