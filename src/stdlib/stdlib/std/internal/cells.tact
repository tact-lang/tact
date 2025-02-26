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

asm(value self) extends fun storeBool(self: Builder, value: Bool): Builder { 1 STI }

/// Extension function for the `Builder` type. Available since Tact 1.5.0.
///
/// Alias to `Builder.storeBool()`.
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
asm(value self) extends fun storeBit(self: Builder, value: Bool): Builder { 1 STI }

/// Extension function for the `Builder` type.
///
/// Stores (serializes) an unsigned `Int` `value` in the range from 0 to 2^120 − 1 inclusive into the copy of the `Builder`. The serialization of `value` consists of a 4-bit unsigned big-endian integer `l`, which is the smallest integer `l` ≥ 0, such that `value` < 2^(8 * `l`), followed by an 8 * `l`-bit unsigned big-endian representation of `value`. Returns that copy of the `Builder`.
///
/// Attempts to store an out-of-bounds `value` throw an exception with exit code 5: `Integer out of expected range`.
///
/// This is the most common way of storing nanoToncoins.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeCoins(42);
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorecoins
///
asm extends fun storeCoins(self: Builder, value: Int): Builder { STVARUINT16 }

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Alias to `Builder.storeCoins()`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeVarUint16(42);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#builderstorevaruint16
/// * https://docs.tact-lang.org/ref/core-cells#builderstorecoins
///
asm extends fun storeVarUint16(self: Builder, value: Int): Builder { STVARUINT16 }

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Similar to `Builder.storeCoins()`, but with a different `value` range: from -2^119 to 2^119 - 1 inclusive.
///
/// Attempts to store an out-of-bounds `value` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeVarInt16(-42);
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorevarint16
///
asm extends fun storeVarInt16(self: Builder, value: Int): Builder { STVARINT16 }

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Stores (serializes) an unsigned `Int` `value` in the range from 0 to 2^248 − 1 inclusive into the copy of the `Builder`. The serialization of `value` consists of a 5-bit unsigned big-endian integer `l`, which is the smallest integer `l` ≥ 0, such that `value` < 2^8 * `l`, followed by an 8 * `l`-bit unsigned big-endian representation of `value`. Returns that copy of the `Builder`.
///
/// Attempts to store an out-of-bounds `value` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeVarUint32(420000);
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorevaruint32
///
asm extends fun storeVarUint32(self: Builder, value: Int): Builder { STVARUINT32 }

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Similar to `Builder.storeVarUint32()`, but with a different `value` range: from -2^247 to 2^247 - 1 inclusive.
///
/// Attempts to store an out-of-bounds `value` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeVarInt32(-420000);
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorevarint32
///
asm extends fun storeVarInt32(self: Builder, value: Int): Builder { STVARINT32 }

asm(cell self) extends fun storeRef(self: Builder, cell: Cell): Builder { STREF }

asm extends fun storeSlice(self: Builder, cell: Slice): Builder { STSLICER }

/// Extension function for the `Builder` type. Available since Tact 1.5.0.
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

/// Extension function for the `Builder` type. Available since Tact 1.5.0.
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

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Computes and returns the `Int` depth of the `Builder`. Produces 0 if the `Builder` has no references stored so far, otherwise 1 plus the maximum of the depths of the referenced cells.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell().storeInt(42, 7);
///     let depth: Int = b.depth(); // 0
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderdepth
///
asm extends fun depth(self: Builder): Int { BDEPTH }

//
// Slice
//

asm extends fun beginParse(self: Cell): Slice { CTOS }

asm(-> 1 0) extends mutates fun loadRef(self: Slice): Cell { LDREF }

/// Extension function for the `Slice` type. Available since Tact 1.5.0.
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
///
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

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Loads a single bit from the `Slice`: if it's 1, then the referenced `Cell` is loaded and returned. If the loaded bit is 0, then nothing else is loaded and `null` is returned.
///
/// Attempts to load such reference `Cell` when `Slice` doesn't contain it throw an exception with exit code 8: `Cell overflow`.
///
/// Attempts to load more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s = msg.asSlice();
///     let outActions = s.loadMaybeRef();
///
///     if (outActions != null) {
///         let actions = outActions!!;
///         // ...process actions...
///     }
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadmayberef
/// * https://docs.tact-lang.org/book/exit-codes
///
asm(-> 1 0) extends mutates fun loadMaybeRef(self: Slice): Cell? { LDOPTREF }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Preloads a single bit from the `Slice`: if it's 1, then the referenced `Cell` is preloaded and returned. If the preloaded bit is 0, then `null` is returned. Doesn't modify the original `Slice`.
///
/// Attempts to preload such reference `Cell` when `Slice` doesn't contain it throw an exception with exit code 8: `Cell overflow`.
///
/// Attempts to preload more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun examples() {
///     let s1: Slice = beginCell().storeMaybeRef(emptyCell()).asSlice();
///     let fizz: Cell = s1.preloadMaybeRef(); // returns emptyCell() and doesn't modify s1
///
///     let s2: Slice = beginCell()
///         .storeMaybeRef(null)
///         .storeMaybeRef(s1.asCell())
///         .asSlice();
///
///     let ref1: Cell = s2.preloadMaybeRef(); // returns null and doesn't modify s2
///     let ref2: Cell = s2.preloadMaybeRef(); // same effect
///     ref1 == null; // true
///     ref1 == ref2; // true
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#slicepreloadmayberef
/// * https://docs.tact-lang.org/book/exit-codes
///
asm extends fun preloadMaybeRef(self: Slice): Cell? { PLDOPTREF }

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

/// Extension mutation function for the `Slice` type. Available since Tact 1.5.0.
///
/// Alias to `Slice.loadBool()`.
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

/// Extension mutation function for the `Slice` type.
///
/// Loads and returns a serialized unsigned `Int` value in the range from 0 to 2^120 - 1 inclusive from the `Slice`. This value usually represents the amount in nanoToncoins.
///
/// Attempts to load such `Int` when `Slice` doesn't contain it throw an exception with exit code 8: `Cell overflow`.
///
/// Attempts to load more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeCoins(42).asSlice();
///     let fizz: Int = s.loadCoins(); // 42
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadcoins
///
asm( -> 1 0) extends mutates fun loadCoins(self: Slice): Int { LDVARUINT16 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.0.
///
/// Alias to `Slice.loadCoins()`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeVarUint16(42).asSlice();
///     let fizz: Int = s.loadVarUint16(); // 42
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadvaruint16
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadcoins
///
asm( -> 1 0) extends mutates fun loadVarUint16(self: Slice): Int { LDVARUINT16 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.0.
///
/// Similar to `Slice.loadCoins()`, but with a different `value` range: from -2^119 to 2^119 - 1 inclusive.
///
/// Attempts to load such `Int` when `Slice` doesn't contain it throw an exception with exit code 8: `Cell overflow`.
///
/// Attempts to load more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeVarInt16(-42).asSlice();
///     let fizz: Int = s.loadVarInt16(); // -42
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadvarint16
///
asm( -> 1 0) extends mutates fun loadVarInt16(self: Slice): Int { LDVARINT16 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.0.
///
/// Loads and returns a serialized unsigned `Int` value in the range from 0 to 2^248 − 1 inclusive from the `Slice`.
///
/// Attempts to load such `Int` when `Slice` doesn't contain it throw an exception with exit code 8: `Cell overflow`.
///
/// Attempts to load more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeVarUint32(420000).asSlice();
///     let fizz: Int = s.loadVarUint32(); // 420000
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadvaruint32
///
asm( -> 1 0) extends mutates fun loadVarUint32(self: Slice): Int { LDVARUINT32 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.0.
///
/// Similar to `Slice.loadVarUint32()`, but with a different `value` range: from -2^247 to 2^247 - 1 inclusive.
///
/// Attempts to load such `Int` when `Slice` doesn't contain it throw an exception with exit code 8: `Cell overflow`.
///
/// Attempts to load more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeVarInt32(-420000).asSlice();
///     let fizz: Int = s.loadVarInt32(); // -420000
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadvarint32
///
asm( -> 1 0) extends mutates fun loadVarInt32(self: Slice): Int { LDVARINT32 }

asm extends mutates fun skipBits(self: Slice, l: Int) { SDSKIPFIRST }

asm extends fun endParse(self: Slice) { ENDS }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Preloads all but the last 0 ≤ `len` ≤ 1023 bits from the `Slice`.
///
/// Attempts to specify an out-of-bounds `len` value throw an exception with exit code 5: `Integer out of expected range`.
///
/// Attempts to preload more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let allButLastFive: Slice = s.skipLastBits(5); // all but last 5 bits,
///                                                    // i.e. only first 2
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceskiplastbits
///
asm extends fun skipLastBits(self: Slice, len: Int): Slice { SDSKIPLAST }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Preloads the first 0 ≤ `len` ≤ 1023 bits from the `Slice`.
///
/// Attempts to specify an out-of-bounds `len` value throw an exception with exit code 5: `Integer out of expected range`.
///
/// Attempts to preload more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let firstFive: Slice = s.firstBits(5); // first 5 bits
/// }
/// ```
///
/// In order to reduce gas usage, prefer calling `Slice.preloadBits()` over using this function since the former is more optimized.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#slicefirstbits
/// * https://docs.tact-lang.org/ref/core-cells#slicepreloadbits
///
asm extends fun firstBits(self: Slice, len: Int): Slice { SDCUTFIRST }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Preloads the last 0 ≤ `len` ≤ 1023 bits from the `Slice`.
///
/// Attempts to specify an out-of-bounds `len` value throw an exception with exit code 5: `Integer out of expected range`.
///
/// Attempts to preload more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let lastFive: Slice = s.lastBits(5); // last 5 bits
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicelastbits
///
asm extends fun lastBits(self: Slice, len: Int): Slice { SDCUTLAST }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Computes and returns the `Int` depth of the `Slice`. Produces 0 if the `Slice` has no references, otherwise 1 plus the maximum of the depths of the referenced cells.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let depth: Int = s.depth(); // 0
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicedepth
///
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

asm fun emptyCell(): Cell {
    <b b> PUSHREF // Pure Fift: "<b" creates a builder, "b>" turns it into a cell at compile time
}

asm fun emptySlice(): Slice {
    b{} PUSHSLICE
}

/// Struct for holding values computed by the `Cell.computeDataSize()` and `Slice.computeDataSize()` extension functions. Available since Tact 1.6.0.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#cellcomputedatasize
/// * https://docs.tact-lang.org/ref/core-cells#slicecomputedatasize
///
struct DataSize {
    /// The total number of nested cells, including the starting one.
    cells: Int;

    /// The total number of bits in all nested cells, including the starting one.
    bits: Int;

    /// The total number of refs in all nested cells, including the starting one.
    refs: Int;
}

/// Extension function for the `Cell` type. Available since Tact 1.6.0.
///
/// Computes and returns the number of distinct cells, bits and refs in the `Cell` by using a depth-first search (DFS) algorithm, recursively traversing each referenced cell. This function is computationally expensive and can consume a lot of gas. If `self` is `null`, returns `DataSize` with all fields set to 0.
///
/// The results are packed into a `DataSize` Struct consisting of:
/// * `cells: Int`, the total number of nested cells, including the starting one
/// * `bits: Int`, the total number of bits in all nested cells, including the starting one
/// * `refs: Int`, the total number of refs in all nested cells, including the starting one
///
/// If the specified `maxCells` value isn't enough to traverse all cells including the starting one, an exception with exit code 8 is thrown: `Cell overflow`.
///
/// Attempts to specify a negative value of `maxCells` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let c: Cell = beginCell().storeInt(42, 7).storeRef(emptyCell()).endCell();
///     try {
///         let dataSize: DataSize = c.computeDataSize(2);
///         dataSize.cells; // 2
///         dataSize.bits;  // 7
///         dataSize.refs;  // 1
///     } catch (exitCode) {
///         // if maxCells was insufficient to traverse the cell
///         // and all of its references, the exitCode here would be 8
///     }
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#cellcomputedatasize
///
asm extends fun computeDataSize(self: Cell?, maxCells: Int): DataSize { CDATASIZE }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Similar to `Cell.computeDataSize()`, but doesn't take into account the cell that contains the `Slice` itself. However, accounts for its bits and refs.
///
/// The results are packed into a `DataSize` Struct consisting of:
/// * `cells: Int`, the total number of nested cells, including the starting one
/// * `bits: Int`, the total number of bits in all nested cells, including the starting one
/// * `refs: Int`, the total number of refs in all nested cells, including the starting one
///
/// If the specified `maxCells` value isn't enough to traverse all cells **not** including the starting one, an exception with exit code 8 is thrown: `Cell overflow`.
///
/// Attempts to specify a negative value of `maxCells` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).storeRef(emptyCell()).asSlice();
///     try {
///         let dataSize: DataSize = s.computeDataSize(1);
///         dataSize.cells; // 1
///         dataSize.bits;  // 7
///         dataSize.refs;  // 1
///     } catch (exitCode) {
///         // if maxCells was insufficient to traverse the cell
///         // and all of its references, the exitCode here would be 8
///     }
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicecomputedatasize
///
asm extends fun computeDataSize(self: Slice, maxCells: Int): DataSize { SDATASIZE }

/// Extension function for the `Cell` type. Available since Tact 1.6.0.
///
/// Computes and returns the `Int` depth of the `Cell`. Produces 0 if the `Cell` has no references, otherwise 1 plus the maximum of the depths of the referenced cells. If c is null, returns zero.
///
/// ```tact
/// fun example() {
///     let c: Cell = beginCell().storeInt(42, 7).endCell();
///     let depth: Int = c.depth(); // 0
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#celldepth
///
asm extends fun depth(self: Cell?): Int { CDEPTH }

