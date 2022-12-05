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