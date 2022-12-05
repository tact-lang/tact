primitive Int;
primitive Bool;
primitive Builder;
primitive Slice;
primitive Cell;
primitive Address;

@name(begin_cell)
native beginCell(): Builder;

@name(store_int)
native storeInt(s: Builder, value: Int, bits: Int): Builder;

@name(store_uint)
native storeUint(s: Builder, value: Int, bits: Int): Builder;

@name(store_coins)
native storeCoins(s: Builder, value: Int): Builder;

@name(store_ref)
native storeRef(s: Builder, cell: Cell): Builder;

@name(store_slice)
native storeSlice(s: Builder, cell: Slice): Builder;

@name(end_cell)
native endCell(s: Builder): Cell;

@name(check_signature)
native checkSignature(hash: Int, signature: Slice, public_key: Int): Bool;

@name(cell_hash)
native hashCell(cell: Cell): Int;

@name(send_raw_message)
native nativeSendMessage(cell: Cell, mode: Int);

@name(raw_reserve)
native nativeReserve(amount: Int, mode: Int);

@name(throw)
native nativeThrow(code: Int);

@name(throw_when)
native nativeThrowWhen(code: Int, condition: Bool);

@name(throw_unless)
native require(code: Int, condition: Bool);

@name(throw_unless)
native nativeThrowUnless(code: Int, condition: Bool);

@name(__tact_compute_contract_address)
native computeAddress(chain: Int, code: Cell, data: Cell): Address;

@name(__tact_store_address)
native storeAddress(s: Builder, address: Address): Builder;

struct SendParameters {
    bounce: Bool = true;
    to: Address;
    value: Int;
    mode: Int = 0;
    body: Cell? = null;
}

fun send(params: SendParameters) {
    let b: Builder = beginCell();
    b = storeInt(b, 0, 1); // internal_message
    b = storeInt(b, true, 1); // ihd_disabled
    b = storeInt(b, params.bounce, 1); // bounce
    b = storeInt(b, false, 1); // bounced
    b = storeInt(b, 0, 2); // From
    b = storeAddress(b, params.to); // To
    b = storeCoins(b, params.value); // Value
    b = storeInt(b, false, 1); // currency_collection
    b = storeCoins(b, 0); // IHR fees
    b = storeCoins(b, 0); // Fwd fees
    b = storeUint(b, 0, 64); // CreatedLT
    b = storeUint(b, 0, 32); // CreatedAt

    // Stateinit
    b = storeInt(b, false, 1); // No state init

    // Body
    // let body: Cell? = params.body;
    // abi.dump(body);
    // if (body != null) {
        // b = storeInt(b, true, 1);
        // b = storeRef(b, body!!);
    // } else {
        b = storeInt(b, false, 1); // No body
    // }

    // Send
    let c: Cell = endCell(b);
    nativeSendMessage(c, params.mode);
}