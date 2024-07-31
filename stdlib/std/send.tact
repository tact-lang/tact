@name(send_raw_message)
native nativeSendMessage(cell: Cell, mode: Int);

const SendRemainingBalance: Int = 128;
const SendRemainingValue: Int = 64;
const SendIgnoreErrors: Int = 2;
const SendPayGasSeparately: Int = 1;
const SendDestroyIfZero: Int = 32;
const SendBounceIfActionFail: Int = 16;

inline fun emit(body: Cell) {
    // ext_out_msg_info$11 src:MsgAddressInt dest:MsgAddressExt created_lt:uint64 created_at:uint32
    //                     maybe: stateInit (false) bodyRef: bool (true)
    let c: Cell = beginCell()
        .storeUint(15211807202738752817960438464513, 104)
        .storeRef(body)
        .endCell();
    nativeSendMessage(c, 0);
}

@name(accept_message)
native acceptMessage();

@name(commit)
native commit();