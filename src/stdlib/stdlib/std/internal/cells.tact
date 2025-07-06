//
// Builder
//

/// Creates a new empty `Builder`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#begincell
///
asm fun beginCell(): Builder { NEWC }

/// Extension function for the `Builder` type.
///
/// Stores a signed `bits`-bit `value` into the copy of the `Builder` for 0 ≤ `bits` ≤ 257.
/// Returns that copy of the `Builder`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeInt(42, 7);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to provide an insufficient or out-of-bounds `bits` number.
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstoreint
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
@name(store_int) // special treatment in Func compiler, so not replaced with asm "STIX"
extends native storeInt(self: Builder, value: Int, bits: Int): Builder;

/// Extension function for the `Builder` type.
///
/// Stores an unsigned `bits`-bit `value` into the copy of the `Builder` for 0 ≤ `bits` ≤ 256.
/// Returns that copy of the `Builder`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeUint(42, 6);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to store a negative `value` or provide an insufficient or out-of-bounds `bits` number.
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstoreuint
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
@name(store_uint) // special treatment in Func compiler, so not replaced with asm "STUX"
extends native storeUint(self: Builder, value: Int, bits: Int): Builder;

/// Extension function for the `Builder` type.
///
/// Stores a `Bool` `value` into the copy of the `Builder`.
/// Writes 1 as a single bit if `value` is `true`, and writes 0 otherwise.
/// Returns that copy of the `Builder`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeBool(true);  // writes 1
///     let buzz: Builder = b.storeBool(false); // writes 0
/// }
/// ```
///
/// #### Exit codes
///
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorebool
///
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
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
/// #### Exit codes
///
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorebit
///
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm(value self) extends fun storeBit(self: Builder, value: Bool): Builder { 1 STI }

/// Extension function for the `Builder` type.
///
/// Stores (serializes) an unsigned `Int` `value` in the range from 0 to 2^120 − 1
/// inclusive into the copy of the `Builder`. The serialization of `value` consists
/// of a 4-bit unsigned big-endian integer `l`, which is the smallest integer `l` ≥ 0,
/// such that `value` < 2^(8 * `l`), followed by an 8 * `l`-bit unsigned big-endian
/// representation of `value`. Returns that copy of the `Builder`.
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
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to store an out-of-bounds `value`.
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorecoins
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
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
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to store an out-of-bounds `value`.
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#builderstorevaruint16
/// * https://docs.tact-lang.org/ref/core-cells#builderstorecoins
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm extends fun storeVarUint16(self: Builder, value: Int): Builder { STVARUINT16 }

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Similar to `Builder.storeCoins()`, but with a different `value` range: from -2^119 to 2^119 - 1 inclusive.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeVarInt16(-42);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to store an out-of-bounds `value`.
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorevarint16
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm extends fun storeVarInt16(self: Builder, value: Int): Builder { STVARINT16 }

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Stores (serializes) an unsigned `Int` `value` in the range from 0 to 2^248 − 1 inclusive into the copy of the `Builder`. The serialization of `value` consists of a 5-bit unsigned big-endian integer `l`, which is the smallest integer `l` ≥ 0, such that `value` < 2^8 * `l`, followed by an 8 * `l`-bit unsigned big-endian representation of `value`. Returns that copy of the `Builder`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeVarUint32(420000);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to store an out-of-bounds `value`.
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorevaruint32
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm extends fun storeVarUint32(self: Builder, value: Int): Builder { STVARUINT32 }

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Similar to `Builder.storeVarUint32()`, but with a different `value` range: from -2^247 to 2^247 - 1 inclusive.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeVarInt32(-420000);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to store an out-of-bounds `value`.
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorevarint32
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm extends fun storeVarInt32(self: Builder, value: Int): Builder { STVARINT32 }

/// Extension function for the `Builder` type.
///
/// Stores a reference `cell` into a copy of the `Builder`.
/// Returns that copy of the `Builder`.
///
/// Note that a single `Cell` can contain up to 4 references.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeRef(emptyCell());
/// }
/// ```
///
/// #### Exit codes
///
/// * 8: [Cell overflow] — Thrown when attempting to store more than 4 references in a single `Cell`.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#builderstoreref
///
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm(cell self) extends fun storeRef(self: Builder, cell: Cell): Builder { STREF }

/// Extension function for the `Builder` type.
///
/// Stores a `slice` into a copy of the `Builder`.
/// Returns that copy of the `Builder`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let s: Slice = emptyCell().asSlice();
///     let fizz: Builder = b.storeSlice(s);
/// }
/// ```
///
/// #### Exit codes
///
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#builderstoreslice
///
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm extends fun storeSlice(self: Builder, slice: Slice): Builder { STSLICER }

/// Extension function for the `Builder` type. Available since Tact 1.5.0.
///
/// Appends all data from the `other` builder to the copy of the `self` builder. Returns that copy.
///
/// ```tact
/// fun example(op: Int, queryId: Int, payload: Builder) {
///    let msgBody = beginCell().storeUint(op, 32).storeUint(queryId, 64);
///    if (payload.bits() != 0) {
///        msgBody = msgBody.storeBuilder(payload); // assignment is important here
///    }
/// }
/// ```
///
/// #### Exit codes
///
/// * 8: [Cell overflow] — Thrown when attempting to store more data than the Builder can fit.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorebuilder
///
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm extends fun storeBuilder(self: Builder, other: Builder): Builder { STBR }

/// Extension function for the `Builder` type. Available since Tact 1.5.0.
///
/// If the `cell` is not `null`, stores 1 as a single bit and then reference `cell` into the copy of the `Builder`. Returns that copy.
///
/// If the `cell` is `null`, only stores 0 as a single bit into the copy of the `Builder`. Returns that copy.
///
/// Note that a single `Cell` can contain up to 4 references.
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
/// #### Exit codes
///
/// * 8: [Cell overflow] — Thrown when attempting to store more than 4 references in a single `Cell`.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstoremayberef
///
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm(cell self) extends fun storeMaybeRef(self: Builder, cell: Cell?): Builder { STOPTREF }

/// Extension function for the `Builder` type.
///
/// Converts a `Builder` into an ordinary `Cell`.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let c: Cell = b.endCell();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderendcell
///
asm extends fun endCell(self: Builder): Cell { ENDC }

/// Extension function for the `Builder` type.
///
/// Returns the number of cell references already stored in the `Builder` as an `Int`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let refs: Int = b.refs(); // 0
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderrefs
///
asm extends fun refs(self: Builder): Int { BREFS }

/// Extension function for the `Builder` type.
///
/// Returns the number of data bits already stored in the `Builder` as an `Int`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let bits: Int = b.bits(); // 0
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderbits
///
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

/// Extension function for the `Cell` type.
///
/// Opens the `Cell` for parsing and returns it as a `Slice`.
///
/// ```tact
/// fun example() {
///     let c: Cell = beginCell();
///     let s: Slice = c.beginParse();
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#cellbeginparse
///
asm extends fun beginParse(self: Cell): Slice { CTOS }

/// Extension mutation function for the `Slice` type.
///
/// Loads the next reference from the `Slice` as a `Cell`.
///
/// ```tact
/// fun example() {
///     let s1: Slice = beginCell().storeRef(emptyCell()).asSlice();
///     let fizz: Cell = s1.loadRef();
///
///     let s2: Slice = beginCell()
///         .storeRef(emptyCell())
///         .storeRef(s1.asCell())
///         .asSlice();
///     let ref1: Cell = s2.loadRef();
///     let ref2: Cell = s2.loadRef();
///     ref1 == ref2; // false
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadref
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadRef(self: Slice): Cell { LDREF }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Skips the next reference from the `Slice`. Similar to discarding the return value of `Slice.loadRef()`.
///
/// ```tact
/// fun example() {
///     let s1: Slice = beginCell()
///         .storeRef(emptyCell())
///         .storeUint(42, 32)
///         .asSlice();
///
///     s1.skipRef();
///     let fizz: Int = s1.loadUint(32); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipref
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipRef(self: Slice) { LDREF NIP }

/// Extension function for the `Slice` type. Available since Tact 1.5.0.
///
/// Preloads the next reference from the `Slice` as a `Cell`. Doesn't modify the original `Slice`.
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
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#slicepreloadref
/// * https://docs.tact-lang.org/book/exit-codes
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends fun preloadRef(self: Slice): Cell { PLDREF }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.0.
///
/// Loads a single bit from the `Slice`: if it's 1, then the referenced `Cell` is loaded
/// and returned. If the loaded bit is 0, then nothing else is loaded and `null` is returned.
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
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadmayberef
/// * https://docs.tact-lang.org/book/exit-codes
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadMaybeRef(self: Slice): Cell? { LDOPTREF }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Skips `Cell?` from the `Slice`. Similar to discarding the return value of `Slice.loadMaybeRef()`.
///
/// ```tact
/// fun example() {
///     let s1: Slice = beginCell()
///         .storeMaybeRef(emptyCell())
///         .storeUint(42, 32)
///         .asSlice();
///
///     s1.skipMaybeRef();
///     let fizz: Int = s1.loadUint(32); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipmayberef
/// * https://docs.tact-lang.org/book/exit-codes
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipMaybeRef(self: Slice) { LDOPTREF NIP }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Preloads a single bit from the `Slice`: if it's 1, then the referenced `Cell` is
/// preloaded and returned. If the preloaded bit is 0, then `null` is returned. Doesn't modify the original `Slice`.
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
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#slicepreloadmayberef
/// * https://docs.tact-lang.org/book/exit-codes
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends fun preloadMaybeRef(self: Slice): Cell? { PLDOPTREF }

/// Extension mutation function for the `Slice` type.
///
/// Loads `0 ≤ l ≤ 1023` bits from the `Slice` and returns them as a separate `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let fizz: Slice = s.loadBits(7);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `l` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadbits
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
@name(load_bits) // special treatment in Func compiler, so not replaced with asm "LDSLICEX"
extends mutates native loadBits(self: Slice, l: Int): Slice;

/// Extension function for the `Slice` type.
///
/// Preloads `0 ≤ l ≤ 1023` bits from the `Slice` and returns them as a separate `Slice`.
/// Doesn't modify the original `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let fizz: Slice = s.preloadBits(7);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `l` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicepreloadbits
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
@name(preload_bits) // special treatment in Func compiler, so not replaced with asm "PLDSLICEX"
extends native preloadBits(self: Slice, l: Int): Slice;

/// Extension mutation function for the `Slice` type.
///
/// Loads and returns a signed `l`-bit `Int` from the `Slice`, for `0 ≤ l ≤ 257`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let fizz: Int = s.loadInt(7);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `l` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadint
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
@name(load_int) // special treatment in Func compiler, so not replaced with asm "LDIX"
extends mutates native loadInt(self: Slice, l: Int): Int;

/// Extension function for the `Slice` type.
///
/// Preloads and returns a signed `l`-bit `Int` from the `Slice`, for `0 ≤ l ≤ 257`.
/// Doesn't modify the `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let fizz: Int = s.preloadInt(7);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `l` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicepreloadint
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
@name(preload_int) // special treatment in Func compiler, so not replaced with asm "PLDIX"
extends native preloadInt(self: Slice, l: Int): Int;

/// Extension mutation function for the `Slice` type.
///
/// Loads and returns an unsigned `l`-bit `Int` from the `Slice`, for `0 ≤ l ≤ 256`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeUint(42, 7).asSlice();
///     let fizz: Int = s.loadUint(7);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `l` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloaduint
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
@name(load_uint) // special treatment in Func compiler, so not replaced with asm "LDUX"
extends mutates native loadUint(self: Slice, l: Int): Int;

/// Extension function for the `Slice` type.
///
/// Preloads and returns an unsigned `l`-bit `Int` from the `Slice`, for `0 ≤ l ≤ 256`.
/// Doesn't modify the `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeUint(42, 7).asSlice();
///     let fizz: Int = s.preloadUint(7);
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `l` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicepreloaduint
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
@name(preload_uint) // special treatment in Func compiler, so not replaced with asm "PLDUX"
extends native preloadUint(self: Slice, l: Int): Int;

/// Extension mutation function for the `Slice` type.
///
/// Loads a single bit and returns a `Bool` value from the `Slice`.
/// Reads `true` if the loaded bit is equal to 1, and reads `false` otherwise.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeBool(true).asSlice();
///     let fizz: Bool = s.loadBool(); // true
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadint
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadBool(self: Slice): Bool { 1 LDI }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Skips a single bit from the `Slice`. Similar to discarding the return value of `Slice.loadBool()`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell()
///         .storeBool(true)
///         .storeUint(42, 7)
///         .asSlice();
///
///     s.skipBool();
///     let fizz: Int = s.loadUint(7); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than the `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipbool
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipBool(self: Slice) { 1 LDI NIP }

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
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than the `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadbit
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadBit(self: Slice): Bool { 1 LDI }

/// Extension mutation function for the `Slice` type.
///
/// Loads and returns a serialized unsigned `Int` value in the range from 0 to 2^120 - 1
/// inclusive from the `Slice`. This value usually represents the amount in nanoToncoins.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeCoins(42).asSlice();
///     let fizz: Int = s.loadCoins(); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadcoins
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadCoins(self: Slice): Int { LDVARUINT16 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Skips a serialized unsigned `Int` value in the range from 0 to 2^120 - 1
/// inclusive from the `Slice`. Similar to discarding the return value of `Slice.loadCoins()`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell()
///         .storeCoins(239)
///         .storeUint(42, 7)
///         .asSlice();
///
///     s.skipCoins();
///     let fizz: Int = s.loadUint(7); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipcoins
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipCoins(self: Slice) { LDVARUINT16 NIP }

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
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadvaruint16
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadcoins
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadVarUint16(self: Slice): Int { LDVARUINT16 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Alias to `Slice.skipCoins()`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell()
///         .storeVarUint16(239)
///         .storeUint(42, 7)
///         .asSlice();
///
///     s.skipVarUint16();
///     let fizz: Int = s.loadUint(7); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipvaruint16
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipcoins
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipVarUint16(self: Slice) { LDVARUINT16 NIP }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.0.
///
/// Similar to `Slice.loadCoins()`, but with a different `value` range: from -2^119 to 2^119 - 1 inclusive.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeVarInt16(-42).asSlice();
///     let fizz: Int = s.loadVarInt16(); // -42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadvarint16
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadVarInt16(self: Slice): Int { LDVARINT16 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Similar to `Slice.skipCoins()`, but with a different `value` range: from -2^119 to 2^119 - 1 inclusive.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell()
///         .storeVarInt16(-239)
///         .storeUint(42, 7)
///         .asSlice();
///
///     s.skipVarInt16();
///     let fizz: Int = s.loadUint(7); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipvarint16
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipVarInt16(self: Slice) { LDVARINT16 NIP }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.0.
///
/// Loads and returns a serialized unsigned `Int` value in the range from 0 to 2^248 − 1 inclusive from the `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeVarUint32(420000).asSlice();
///     let fizz: Int = s.loadVarUint32(); // 420000
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadvaruint32
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadVarUint32(self: Slice): Int { LDVARUINT32 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Skips a serialized unsigned `Int` value in the range from 0 to 2^248 − 1 inclusive
/// from the `Slice`. Similar to discarding the return value of `Slice.loadVarUint32()`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell()
///         .storeVarUint32(239)
///         .storeUint(42, 7)
///         .asSlice();
///
///     s.skipVarUint32();
///     let fizz: Int = s.loadUint(7); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipvaruint32
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipVarUint32(self: Slice) { LDVARUINT32 NIP }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.0.
///
/// Similar to `Slice.loadVarUint32()`, but with a different `value` range:
/// from -2^247 to 2^247 - 1 inclusive.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeVarInt32(-420000).asSlice();
///     let fizz: Int = s.loadVarInt32(); // -420000
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceloadvarint32
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadVarInt32(self: Slice): Int { LDVARINT32 }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Similar to `Slice.skipVarUint32()`, but with a different `value` range:
/// from -2^247 to 2^247 - 1 inclusive.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell()
///         .storeVarInt32(-239)
///         .storeUint(42, 7)
///         .asSlice();
///
///     s.skipVarInt32();
///     let fizz: Int = s.loadUint(7); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipvaruint32
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipVarInt32(self: Slice) { LDVARINT32 NIP }

/// Extension mutation function for the `Slice` type.
///
/// Loads all but the first `0 ≤ l ≤ 1023` bits from the `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     s.skipBits(5);                   // all but first 5 bits
///     let fizz: Slice = s.loadBits(1); // load only 1 bit
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `l` value.
/// * 9: [Cell underflow] — Thrown when attempting to load more data than the `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceskipbits
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipBits(self: Slice, l: Int) { SDSKIPFIRST }

/// Extension function for the `Slice` type.
///
/// Checks whether the `Slice` is empty (i.e., contains no bits of data and no cell references).
/// If it is not, it throws an exception with [exit code 9]: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let emptyOne: Slice = emptySlice();
///     emptyOne.endParse(); // nothing, as it's empty
///
///     let paul: Slice = "Fear is the mind-killer".asSlice();
///     try {
///         paul.endParse(); // throws exit code 9
///     }
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when the `Slice` is not empty.
///
/// [exit code 9]: https://docs.tact-lang.org/book/exit-codes#9
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends fun endParse(self: Slice) { ENDS }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Preloads all but the last `0 ≤ len ≤ 1023` bits from the `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let allButLastFive: Slice = s.skipLastBits(5); // all but last 5 bits,
///                                                    // i.e. only first 2
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `len` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceskiplastbits
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends fun skipLastBits(self: Slice, len: Int): Slice { SDSKIPLAST }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Preloads the first `0 ≤ len ≤ 1023` bits from the `Slice`.
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
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `len` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#slicefirstbits
/// * https://docs.tact-lang.org/ref/core-cells#slicepreloadbits
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends fun firstBits(self: Slice, len: Int): Slice { SDCUTFIRST }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Preloads the last `0 ≤ len ≤ 1023` bits from the `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeInt(42, 7).asSlice();
///     let lastFive: Slice = s.lastBits(5); // last 5 bits
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify an out-of-bounds `len` value.
/// * 9: [Cell underflow] — Thrown when attempting to preload more data than `Slice` contains.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#slicelastbits
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends fun lastBits(self: Slice, len: Int): Slice { SDCUTLAST }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Computes and returns the `Int` depth of the `Slice`. Produces 0 if
/// the `Slice` has no references, otherwise 1 plus the maximum of the depths of the referenced cells.
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

/// Extension function for the `Slice` type.
///
/// Returns the number of references in the `Slice` as an `Int`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeRef(emptyCell()).asSlice();
///     let fizz: Int = s.refs();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicerefs
///
asm extends fun refs(self: Slice): Int { SREFS }

/// Extension function for the `Slice` type.
///
/// Returns the number of data bits in the `Slice` as an `Int`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeRef(emptyCell()).asSlice();
///     let fizz: Int = s.bits();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicebits
///
asm extends fun bits(self: Slice): Int { SBITS }

/// Extension function for the `Slice` type.
///
/// Checks whether the `Slice` is empty (i.e., contains no bits of data and no cell references).
/// Returns `true` if it is empty, `false` otherwise.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeRef(emptyCell()).asSlice();
///     let fizz: Bool = s.empty();                     // false
///     let buzz: Bool = beginCell().asSlice().empty(); // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceempty
///
asm extends fun empty(self: Slice): Bool { SEMPTY }

/// Extension function for the `Slice` type.
///
/// Checks whether the `Slice` has no bits of data.
/// Returns `true` if it has no data, `false` otherwise.
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeRef(emptyCell()).asSlice();
///     let fizz: Bool = s.dataEmpty();  // true
///
///     let s2: Slice = beginCell().storeInt(42, 7).asSlice();
///     let buzz: Bool = s2.dataEmpty(); // false
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicedataempty
///
asm extends fun dataEmpty(self: Slice): Bool { SDEMPTY }

/// Extension function for the `Slice` type.
///
/// Checks whether the `Slice` has no references.
/// Returns `true` if it has no references, `false` otherwise.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeRef(emptyCell()).asSlice();
///     let fizz: Bool = s.refsEmpty();                     // false
///     let buzz: Bool = beginCell().asSlice().refsEmpty(); // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicerefsempty
///
asm extends fun refsEmpty(self: Slice): Bool { SREMPTY }

//
// Conversions
//

/// Extension function for the `Builder` type.
///
/// Converts the `Builder` into a `Slice` and returns it.
/// An alias to `self.endCell().beginParse()`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Slice = b.asSlice();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderasslice
///
inline extends fun asSlice(self: Builder): Slice {
    return self.endCell().beginParse();
}

/// Extension function for the `Cell` type.
///
/// Converts the `Cell` to a `Slice` and returns it.
/// An alias to `self.beginParse()`.
///
/// ```tact
/// fun example() {
///     let c: Cell = emptyCell();
///     let fizz: Slice = c.asSlice();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#cellasslice
///
inline extends fun asSlice(self: Cell): Slice {
    return self.beginParse();
}

/// Extension function for the `Slice` type.
///
/// Converts the `Slice` to a `Cell` and returns it.
/// An alias to `beginCell().storeSlice(self).endCell()`.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().asSlice();
///     let fizz: Cell = s.asCell();
///     let buzz: Cell = beginCell().storeSlice(s).endCell();
///
///     fizz == buzz; // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceascell
///
inline extends fun asCell(self: Slice): Cell {
    return beginCell()
        .storeSlice(self)
        .endCell();
}

/// Extension function for the `Builder` type.
///
/// Converts the `Builder` into a `Cell` and returns it.
/// An alias to `self.endCell()`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Cell = b.asCell();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderascell
///
inline extends fun asCell(self: Builder): Cell {
    return self.endCell();
}

/// Creates and returns an empty `Cell` (without data and references).
/// An alias to `beginCell().endCell()`.
///
/// ```tact
/// fun example() {
///     let fizz: Cell = emptyCell();
///     let buzz: Cell = beginCell().endCell();
///
///     fizz == buzz; // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#emptycell
///
asm fun emptyCell(): Cell {
    <b b> PUSHREF // Pure Fift: "<b" creates a builder, "b>" turns it into a cell at compile time
}

/// Creates and returns an empty `Slice` (without data and references).
/// An alias to `emptyCell().asSlice()`.
///
/// ```tact
/// fun example() {
///     let fizz: Slice = emptySlice();
///     let buzz: Slice = emptyCell().asSlice();
///
///     fizz == buzz; // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#emptyslice
///
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
/// The results are packed into a `DataSize` struct consisting of:
/// * `cells: Int`, the total number of nested cells, including the starting one
/// * `bits: Int`, the total number of bits in all nested cells, including the starting one
/// * `refs: Int`, the total number of refs in all nested cells, including the starting one
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
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify a negative value of `maxCells`.
/// * 8: [Cell overflow] — Thrown when the specified `maxCells` value isn't enough to traverse all cells including the starting one.
///
/// See: https://docs.tact-lang.org/ref/core-cells#cellcomputedatasize
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm extends fun computeDataSize(self: Cell?, maxCells: Int): DataSize { CDATASIZE }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Similar to `Cell.computeDataSize()`, but doesn't take into account the cell that contains the `Slice` itself. However, accounts for its bits and refs.
///
/// The results are packed into a `DataSize` struct consisting of:
/// * `cells: Int`, the total number of nested cells, including the starting one
/// * `bits: Int`, the total number of bits in all nested cells, including the starting one
/// * `refs: Int`, the total number of refs in all nested cells, including the starting one
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
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify a negative value of `maxCells`.
/// * 8: [Cell overflow] — Thrown when the specified `maxCells` value isn't enough to traverse all cells **not** including the starting one.
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicecomputedatasize
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
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
