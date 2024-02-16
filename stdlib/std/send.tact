@name(send_raw_message)
native nativeSendMessage(cell: Cell, mode: Int);

const SendRemainingBalance: Int = 128;
const SendRemainingValue: Int = 64;
const SendIgnoreErrors: Int = 2;
const SendPayGasSeparately: Int = 1;
const SendDestroyIfZero: Int = 32;
const SendBounceIfActionFail: Int = 16;

struct SendParameters {
    bounce: Bool = true;
    to: Address;
    value: Int;
    mode: Int = 0;
    body: Cell? = null;
    code: Cell? = null;
    data: Cell? = null;
}

fun send(params: SendParameters) {
    let b: Builder = beginCell();
    b = b.storeInt(1, 2); // internal_message + ihd_disabled
    b = b.storeBool(params.bounce); // bounce
    b = b.storeInt(0, 3); // bounced + from
    b = b.storeAddress(params.to); // To
    b = b.storeCoins(params.value); // Value
    b = b.storeInt(0, 1 + 4 + 4 + 64 + 32); // currency_collection + IHR fees + Fwd fees + CreatedLT + CreatedAt

    // Stateinit
    if (params.code != null || params.data != null) {
        b = b.storeBool(true); // State init

        // Assemble state init cell
        let bc: Builder = beginCell();
        bc = bc.storeBool(false); // SplitDepth
        bc = bc.storeBool(false); // TickTock
        if (params.code != null) {
            bc = bc.storeBool(true); // Code presence
            bc = bc.storeRef(params.code!!);
        } else {
            bc = bc.storeBool(false); // Code presence
        }
        if (params.data != null) {
            bc = bc.storeBool(true); // Data presence
            bc = bc.storeRef(params.data!!);
        } else {
            bc = bc.storeBool(false); // Data presence
        }
        bc = bc.storeBool(false); // Library

        b = b.storeBool(true); // Store as ref
        b = b.storeRef(bc.endCell());
    } else {
        b = b.storeBool(false); // No state init
    }

    // Body
    let body: Cell? = params.body;
    if (body != null) {
        b = b.storeBool(true);
        b = b.storeRef(body!!);
    } else {
        b = b.storeBool(false); // No body
    }

    // Send
    let c: Cell = b.endCell();
    nativeSendMessage(c, params.mode);
}

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