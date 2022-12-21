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
// Builder Size
//

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
extends native preload_ref(self: Slice): Cell;

@name(load_int)
extends mutates native loadInt(self: Slice, l: Int): Int;

@name(preload_int)
extends native preloadInt(self: Slice, l: Int): Int;

@name(load_int)
extends mutates native loadUint(self: Slice, l: Int): Int;

@name(preload_int)
extends native preloadUint(self: Slice, l: Int): Int;

@name(__tact_store_address)
native storeAddress(s: Builder, address: Address): Builder;

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