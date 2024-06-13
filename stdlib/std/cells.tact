//
// Builder
//

@name(begin_cell)
native beginCell(): Builder;

@name(store_int)
extends native storeInt(self: Builder, value: Int, bits: Int): Builder;

@name(store_uint)
extends native storeUint(self: Builder, value: Int, bits: Int): Builder;

@name(__tact_store_bool)
extends native storeBool(self: Builder, value: Bool): Builder;

@name(store_coins)
extends native storeCoins(self: Builder, value: Int): Builder;

@name(store_ref)
extends native storeRef(self: Builder, cell: Cell): Builder;

@name(store_slice)
extends native storeSlice(self: Builder, cell: Slice): Builder;

@name(__tact_store_address)
extends native storeAddress(self: Builder, address: Address): Builder;

@name(end_cell)
extends native endCell(self: Builder): Cell;

@name(builder_refs)
extends native refs(self: Builder): Int;

@name(builder_bits)
extends native bits(self: Builder): Int;

//
// Slice
//

@name(begin_parse)
extends native beginParse(self: Cell): Slice;

@name(load_ref)
extends mutates native loadRef(self: Slice): Cell;

@name(preload_ref)
extends native preloadRef(self: Slice): Cell;

@name(load_bits)
extends mutates native loadBits(self: Slice, l: Int): Slice;

@name(preload_bits)
extends native preloadBits(self: Slice, l: Int): Slice;

@name(load_int)
extends mutates native loadInt(self: Slice, l: Int): Int;

@name(preload_int)
extends native preloadInt(self: Slice, l: Int): Int;

@name(load_uint)
extends mutates native loadUint(self: Slice, l: Int): Int;

@name(preload_uint)
extends native preloadUint(self: Slice, l: Int): Int;

@name(__tact_load_bool)
extends mutates native loadBool(self: Slice): Bool;

@name(load_coins)
extends mutates native loadCoins(self: Slice): Int;

@name(__tact_load_address)
extends mutates native loadAddress(self: Slice): Address;

@name(skip_bits)
extends mutates native skipBits(self: Slice, l: Int);

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
// Conversions
//

inline extends fun asSlice(self: Builder): Slice {
    return self.endCell().beginParse();
}

inline extends fun asSlice(self: Cell): Slice {
    return self.beginParse();
}

inline extends fun asCell(self: Slice): Cell {
    return beginCell()
        .storeSlice(self)
        .endCell();
}

inline extends fun asCell(self: Builder): Cell {
    return self.endCell();
}

inline fun emptyCell(): Cell {
    return beginCell().endCell();
}

inline fun emptySlice(): Slice {
    return emptyCell().asSlice();
}