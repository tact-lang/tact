@name(send_raw_message)
native nativeSendMessage(cell: Cell, mode: Int);

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
    b = storeInt(b, 1, 2); // internal_message + ihd_disabled
    b = storeBool(b, params.bounce); // bounce
    b = storeInt(b, 0, 3); // bounced + from
    b = storeAddress(b, params.to); // To
    b = storeCoins(b, params.value); // Value
    b = storeInt(b, 0, 1 + 4 + 4 + 64 + 32); // currency_collection + IHR fees + Fwd fees + CreatedLT + CreatedAt

    // Stateinit
    if (params.code != null || params.data != null) {
        b = storeBool(b, true); // State init

        // Assemble state init cell
        let bc: Builder = beginCell();
        bc = storeBool(bc, false); // SplitDepth
        bc = storeBool(bc, false); // TickTock
        if (params.code != null) {
            bc = storeBool(bc, true); // Code presence
            bc = storeRef(bc, params.code!!);
        } else {
            bc = storeBool(bc, false); // Code presence
        }
        if (params.data != null) {
            bc = storeBool(bc, true); // Data presence
            bc = storeRef(bc, params.data!!);
        } else {
            bc = storeBool(bc, false); // Data presence
        }
        bc = storeBool(bc, false); // Library

        b = storeBool(b, true); // Store as ref
        b = storeRef(b, endCell(bc));
    } else {
        b = storeBool(b, false); // No state init
    }

    // Body
    let body: Cell? = params.body;
    if (body != null) {
        b = storeBool(b, true);
        b = storeRef(b, body!!);
    } else {
        b = storeBool(b, false); // No body
    }

    // Send
    let c: Cell = endCell(b);
    nativeSendMessage(c, params.mode);
}

fun reply(body: Cell?) {
    let ctx: Context = context();
    send(SendParameters{
        bounce: true,
        to: ctx.sender,
        value: 0,
        mode: 64 + 2, 
        body: body
    });
}