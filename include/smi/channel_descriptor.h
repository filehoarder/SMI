#ifndef CHANNEL_DESCRIPTOR_H
#define CHANNEL_DESCRIPTOR_H
#pragma OPENCL EXTENSION cl_intel_channels : enable
#include "network_message.h"
#include "operation_type.h"
#include "data_types.h"

#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

//NEW
#define BUFF_SIZE 1024    //TODO: understand where this should be put. Must be a multiple of 8

/*
 * TODO:
 * - src and rcv rank are duplicated into the channel descriptor and packet.
 * - processed elements: currently not used. It could be exploited for some basic functionality
 */
typedef struct __attribute__((packed)) __attribute__((aligned(64))){
    SMI_Network_message net;          //buffered network message
    char sender_rank;
    char receiver_rank;
    char port;
    uint message_size;              //given in number of data elements
    uint processed_elements;        //how many data elements we have sent/received
    uint packet_element_id;         //given a packet, the id of the element that we are currently processing (from 0 to the data elements per packet)
    SMI_Datatype data_type;               //type of message
    char op_type;            //type of operation
    char size_of_type;              //size of data type
    char elements_per_packet;       //number of data elements per packet
    bool rendezvous;                //true if rendezvous has been done, false otherwise
    uint tokens;                    //current number of tokens
    uint max_tokens;                //max tokens on the sender side
}SMI_Channel;



#endif
