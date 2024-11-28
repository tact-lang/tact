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

/// Extension function for the `Builder`. Alias to `Builder.storeBool()`. Available since Tact 1.5.0.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeBit(true);  // writes 1
///     let buzz: Builder = b.storeBit(false); // writes 0
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorebit
///
@name(__tact_store_bool)
extends native storeBit(self: Builder, value: Bool): Builder;

asm extends fun storeCoins(self: Builder, value: Int): Builder { STVARUINT16 }

asm(cell self) extends fun storeRef(self: Builder, cell: Cell): Builder { STREF }

asm extends fun storeSlice(self: Builder, cell: Slice): Builder { STSLICER }

/// Extension function for the `Builder`. Available since Tact 1.5.0.
///
/// Appends all data from a `Builder` `cell` to the copy of the `Builder`. Returns that copy.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell().storeCoins(42);
///     let fizz: Builder = beginCell().storeBuilder(b);
///     b.endCell() == fizz.endCell(); // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorebuilder
///
asm extends fun storeBuilder(self: Builder, cell: Builder): Builder { STBR }

@name(__tact_store_address)
extends native storeAddress(self: Builder, address: Address): Builder;

/// Extension function for the `Builder`. Available since Tact 1.5.0.
///
/// If the `cell` is not `null`, stores 1 as a single bit and then reference `cell` into the copy of the `Builder`. Returns that copy.
///
/// If the `cell` is `null`, only stores 0 as a single bit into the copy of the `Builder`. Returns that copy.
///
/// As a single `Cell` can store up to 4 references, attempts to store more throw an exception with exit code 8: `Cell overflow`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b
///         .storeMaybeRef(emptyCell()) // 1, then empty cell
///         .storeMaybeRef(null);       // 0
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstoremayberef
///
asm(cell self) extends fun storeMaybeRef(self: Builder, cell: Cell?): Builder { STOPTREF }

asm extends fun endCell(self: Builder): Cell { ENDC }

asm extends fun refs(self: Builder): Int { BREFS }

asm extends fun bits(self: Builder): Int { BBITS }

asm extends fun depth(self: Builder): Int { BDEPTH }

//
// Slice
//

asm extends fun beginParse(self: Cell): Slice { CTOS }

asm(-> 1 0) extends mutates fun loadRef(self: Slice): Cell { LDREF }

/// Extension function for the `Slice`. Available since Tact 1.5.0.
///
/// Preloads the next reference from the `Slice` as a `Cell`. Doesn't modify the original `Slice`.
///
/// Attempts to preload such reference `Cell` when `Slice` doesn't contain it throw an exception with exit code 8: `Cell overflow`.
///
/// Attempts to preload more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun examples() {
///     let s1: Slice = beginCell().storeRef(emptyCell()).asSlice();
///     let fizz: Cell = s1.preloadRef(); // didn't modify s1
///
///     let s2: Slice = beginCell()
///         .storeRef(emptyCell())
///         .storeRef(s1.asCell())
///         .asSlice();
///     let ref1: Cell = s2.preloadRef();
///     let ref2: Cell = s2.preloadRef();
///     ref1 == ref2; // true
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#slicepreloadref
/// * https://docs.tact-lang.org/book/exit-codes
///
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

/// Extension mutation function for the `Slice`. Alias to `Slice.loadBool()`. Available since Tact 1.5.0.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeBool(true).asSlice();
///     let fizz: Bool = s.loadBit(); // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadbit
///
asm(-> 1 0) extends mutates fun loadBit(self: Slice): Bool { 1 LDI }

asm( -> 1 0) extends mutates fun loadCoins(self: Slice): Int { LDVARUINT16 }

@name(__tact_load_address)
extends mutates native loadAddress(self: Slice): Address;

asm extends mutates fun skipBits(self: Slice, l: Int) { SDSKIPFIRST }

asm extends fun endParse(self: Slice) { ENDS }

asm extends fun skipLastBits(self: Slice, len: Int): Slice { SDSKIPLAST }

asm extends fun firstBits(self: Slice, len: Int): Slice { SDCUTFIRST }

asm extends fun lastBits(self: Slice, len: Int): Slice { SDCUTLAST }

asm extends fun depth(self: Slice): Int { SDEPTH }

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

asm fun addressNone(): Address? { b{00} PUSHSLICE }

struct DataSize {
    cells: Int;
    bits: Int;
    refs: Int;
}

asm extends fun computeDataSize(self: Cell, maxCells: Int): DataSize { CDATASIZE }

asm extends fun computeDataSize(self: Slice, maxCells: Int): DataSize { SDATASIZE }

asm extends fun depth(self: Cell): Int { CDEPTH }

