primitive Int;
primitive Bool;
primitive Builder;
primitive Slice;
primitive Cell;
primitive Address;

//
// Builder
//

@name(begin_cell)
native beginCell(): Builder;

@name(store_int)
native storeInt(s: Builder, value: Int, bits: Int): Builder;

@name(store_uint)
native storeUint(s: Builder, value: Int, bits: Int): Builder;

fun storeBool(s: Builder, value: Bool): Builder {

    // TODO: Make it optimal
    if (value) {
        return storeInt(s, -1, 1);
    } else {
        return storeInt(s, 0, 1);
    }
}

@name(store_coins)
native storeCoins(s: Builder, value: Int): Builder;

@name(store_ref)
native storeRef(s: Builder, cell: Cell): Builder;

@name(store_slice)
native storeSlice(s: Builder, cell: Slice): Builder;

@name(end_cell)
native endCell(s: Builder): Cell;

//
// Slice
//

@name(begin_parse)
extends native beginParse(self: Cell): Slice;

@name(load_ref)
extends mutates native loadRef(self: Slice): Cell;

@name(preload_ref)
extends native preload_ref(self: Slice): Cell;

@name(load_int)
extends mutates native loadInt(self: Slice, l: Int): Int;

@name(preload_int)
extends native preloadInt(self: Slice, l: Int): Int;

@name(load_int)
extends mutates native loadUint(self: Slice, l: Int): Int;

@name(preload_int)
extends native preloadUint(self: Slice, l: Int): Int;

@name(end_parse)
extends native endParse(self: Slice);

//
// Slice size
//

@name(slice_refs)
extends native refs(self: Slice): Int;

@name(slice_bits)
extends native bits(self: Slice): Int;

@name(slice_empty?)
extends native empty(self: Slice): Bool;

@name(slice_data_empty?)
extends native dataEmpty(self: Slice): Bool;

@name(slice_refs_empty?)
extends native refsEmpty(self: Slice): Bool;

//
// Application-specific
//

@name(check_signature)
native checkSignature(hash: Int, signature: Slice, public_key: Int): Bool;

@name(cell_hash)
native hashCell(cell: Cell): Int;

@name(slice_hash)
native hashSlice(slice: Slice): Int;

@name(send_raw_message)
native nativeSendMessage(cell: Cell, mode: Int);

@name(raw_reserve)
native nativeReserve(amount: Int, mode: Int);

@name(throw)
native nativeThrow(code: Int);

@name(throw_when)
native nativeThrowWhen(code: Int, condition: Bool);

fun require(condition: Bool) {
    nativeThrowUnless(131, condition);
}

@name(throw)
native throw(code: Int);

@name(throw_unless)
native nativeThrowUnless(code: Int, condition: Bool);

@name(__tact_compute_contract_address)
native contractAddress(chain: Int, code: Cell, data: Cell): Address;

@name(__tact_store_address)
native storeAddress(s: Builder, address: Address): Builder;

@name(my_address)
native myAddress(): Address;

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
    b = storeInt(b, params.bounce, 1); // bounce
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
            bc = storeRef(bc, params.code);
        } else {
            bc = storeBool(bc, false); // Code presence
        }
        if (params.data != null) {
            bc = storeBool(bc, true); // Data presence
            bc = storeRef(bc, params.data);
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
        b = storeInt(b, true, 1);
        b = storeRef(b, body!!);
    } else {
        b = storeInt(b, false, 1); // No body
    }

    // Send
    let c: Cell = endCell(b);
    nativeSendMessage(c, params.mode);
}

//
// Math 
//

@name(random)
native random(): Int;

@name(rand)
native randomInterval(max: Int): Int;

@name(randomize)
native randomize(x: Int);

@name(randomize_lt)
native randomizeLt();

@name(min)
native min(x: Int, y: Int): Int;

@name(max)
native max(x: Int, y: Int): Int;

@name(abs)
native abs(x: Int): Int;

@name(now)
native now(): Int;

//
// Message Context
//

struct Context {
    bounced: Bool;
    sender: Address;
    value: Int;
}

@name(__tact_context_get)
native context(): Context;

//
// State init
//

struct StateInit {
    code: Cell;
    data: Cell;
}