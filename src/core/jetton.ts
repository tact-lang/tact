// InternalMsgBody
//     transfer
//         #0f8a7ea5
//         query_id:uint64
//         amount:(VarUInteger 16)
//         destination:MsgAddress
//         response_destination:MsgAddress
//         custom_payload:(Maybe ^Cell)
//         forward_ton_amount:(VarUInteger 16)
//         forward_payload:(Either Cell ^Cell)
//     transfer_notification
//         #7362d09c
//         query_id:uint64
//         amount:(VarUInteger 16)
//         sender:MsgAddress
//         forward_payload:(Either Cell ^Cell)
//     excesses
//         #d53276db
//         query_id:uint64
//     burn
//         #595f07bc
//         query_id:uint64
//         amount:(VarUInteger 16)
//         response_destination:MsgAddress
//         custom_payload:(Maybe ^Cell)
//     internal_transfer
//         #178d4519
//         query_id:uint64
//         amount:(VarUInteger 16)
//         from:MsgAddress
//         response_address:MsgAddress
//         forward_ton_amount:(VarUInteger 16)
//         forward_payload:(Either Cell ^Cell)
//     burn_notification
//         #7bdd97de
//         query_id:uint64
//         amount:(VarUInteger 16)
//         sender:MsgAddress
//         response_destination:MsgAddress

import { either } from "@/core/either";
import { maybe } from "@/core/maybe";
import { msgAddress } from "@/core/msg-address";
import { uint, uintVar } from "@/core/numeric";
import { type GetTlb, literal, object, ref, type Tlb } from "@/core/tlb";

export const transfer = <Custom, Forward>(
    custom: Tlb<Custom>,
    forward: Tlb<Forward>,
) => {
    return object({
        $: literal(uint(32))(0x0f8a7ea5),
        queryId: uint(64),
        amount: uintVar(16),
        destination: msgAddress,
        responseDestination: msgAddress,
        customPayload: maybe(ref(custom)),
        forwardTonAmount: uintVar(16),
        forwardPayload: either(forward, ref(forward)),
    });
};

export type Transfer<T, U> = GetTlb<ReturnType<typeof transfer<T, U>>>
