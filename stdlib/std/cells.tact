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
