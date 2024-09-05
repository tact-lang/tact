//
// Builder
//

asm fun beginCell(): Builder { NEWC }

// special treatment in Func compiler, so not replaced with asm "STIX"
@name(store_int)
extends native storeInt(self: Builder, value: Int, bits: Int): Builder;

// special treatment in Func compiler, so not replaced with asm "STUX"
@name(store_uint)
extends native storeUint(self: Builder, value: Int, bits: Int): Builder;

@name(__tact_store_bool)
extends native storeBool(self: Builder, value: Bool): Builder;

@name(__tact_store_bool)
extends native storeBit(self: Builder, value: Bool): Builder;

asm extends fun storeCoins(self: Builder, value: Int): Builder { STVARUINT16 }

asm(cell self) extends fun storeRef(self: Builder, cell: Cell): Builder { STREF }

asm extends fun storeSlice(self: Builder, cell: Slice): Builder { STSLICER }

asm extends fun storeBuilder(self: Builder, cell: Builder): Builder { STBR }

@name(__tact_store_address)
extends native storeAddress(self: Builder, address: Address): Builder;

asm(cell self) extends fun storeMaybeRef(self: Builder, cell: Cell?): Builder { STOPTREF }

asm extends fun endCell(self: Builder): Cell { ENDC }

asm extends fun refs(self: Builder): Int { BREFS }

asm extends fun bits(self: Builder): Int { BBITS }

//
// Slice
//

asm extends fun beginParse(self: Cell): Slice { CTOS }

asm(-> 1 0) extends mutates fun loadRef(self: Slice): Cell { LDREF }

asm extends fun preloadRef(self: Slice): Cell { PLDREF }

// special treatment in Func compiler, so not replaced with asm "LDSLICEX"
@name(load_bits)
extends mutates native loadBits(self: Slice, l: Int): Slice;

// special treatment in Func compiler, so not replaced with asm "PLDSLICEX"
@name(preload_bits)
extends native preloadBits(self: Slice, l: Int): Slice;

// special treatment in Func compiler, so not replaced with asm "LDIX"
@name(load_int)
extends mutates native loadInt(self: Slice, l: Int): Int;

// special treatment in Func compiler, so not replaced with asm "PLDIX"
@name(preload_int)
extends native preloadInt(self: Slice, l: Int): Int;

// special treatment in Func compiler, so not replaced with asm "LDUX"
@name(load_uint)
extends mutates native loadUint(self: Slice, l: Int): Int;

// special treatment in Func compiler, so not replaced with asm "PLDUX"
@name(preload_uint)
extends native preloadUint(self: Slice, l: Int): Int;

asm(-> 1 0) extends mutates fun loadBool(self: Slice): Bool { 1 LDI }

asm(-> 1 0) extends mutates fun loadBit(self: Slice): Bool { 1 LDI }

asm( -> 1 0) extends mutates fun loadCoins(self: Slice): Int { LDVARUINT16 }

@name(__tact_load_address)
extends mutates native loadAddress(self: Slice): Address;

asm extends mutates fun skipBits(self: Slice, l: Int) { SDSKIPFIRST }

asm extends fun endParse(self: Slice) { ENDS }

//
// Slice size
//

asm extends fun refs(self: Slice): Int { SREFS }

asm extends fun bits(self: Slice): Int { SBITS }

asm extends fun empty(self: Slice): Bool { SEMPTY }

asm extends fun dataEmpty(self: Slice): Bool { SDEMPTY }

asm extends fun refsEmpty(self: Slice): Bool { SREMPTY }

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