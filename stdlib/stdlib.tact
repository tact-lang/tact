primitive Int;
primitive Bool;
primitive Builder;
primitive Slice;
primitive Cell;

@name(begin_cell)
native beginCell(): Builder;

@name(store_int)
native storeInt(self: Builder, value: Int, bits: Int): Builder;

@name(store_uint)
native storeUint(self: Builder, value: Int, bits: Int): Builder;

@name(store_coins)
native storeCoins(self: Builder, value: Int): Builder;

@name(store_ref)
native storeRef(self: Builder, cell: Cell): Builder;

@name(store_slice)
native storeSlice(self: Builder, cell: Slice): Builder;

@name(end_cell)
native endCell(self: Builder): Cell;

@name(check_signature)
native checkSignature(hash: Int, signature: Slice, public_key: Int): Bool;

@name(cell_hash)
native hashCell(cell: Cell): Int;

@name(send_raw_message)
native nativeSendMessage(cell: Cell, mode: Int);

@name(send_raw_message)
native nativeReserve(amount: Int, mode: Int);

@name(throw)
native nativeThrow(code: Int);

@name(throw_when)
native nativeThrowWhen(code: Int, condition: Bool);

@name(throw_unless)
native require(code: Int, condition: Bool);

@name(throw_unless)
native nativeThrowUnless(code: Int, condition: Bool);