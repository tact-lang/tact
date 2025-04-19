// This file contains the definitions of the built-in functions that are available in the Tact language.

/// Checks the condition and throws an error with an exit code generated from
/// the error message if the condition is false. Does nothing otherwise.
///
/// The generated exit code is guaranteed to be outside the common 0−255 range reserved
/// for TVM and Tact contract errors, which makes it possible to distinguish exit codes
/// from `require()` and any other standard exit codes.
///
/// ```tact
/// fun examples() {
///     // now() has to return a value greater than 1000,
///     // otherwise an error message will be thrown
///     require(now() > 1000, "We're in the first 1000 seconds of 1 January 1970!");
///
///     try {
///         // The following will never be true, so this require would always throw
///         require(now() < -1, "Time is an illusion. Lunchtime doubly so.");
///     } catch (e) {
///         // e will be outside of range 0-255
///         dump(e);
///     }
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#require
/// * https://docs.tact-lang.org/book/compile/#report
///
fun require(that: Bool, msg: String);

/// Prints the argument `arg` to the contract's debug console. Evaluated only if
/// the `debug` option in the configuration file is set to `true`, otherwise does nothing.
///
/// This function is computationally expensive and consumes a lot of gas because
/// it prints the location from which it was called, i.e. the filename,
/// line and column numbers, and the original expression that was the `arg` argument.
///
/// Can be applied to the following list of types and values:
/// * `Int`
/// * `Bool`
/// * `Address`
/// * `Cell`, `Builder` or `Slice`
/// * `String`
/// * `map<K, V>`
/// * Optionals and `null` value
/// * `void`, which is implicitly returned when a function doesn't have return value defined
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#dump
/// * https://docs.tact-lang.org/book/config/#options-debug
///
fun dump(arg: T);

/// Prints the total stack depth and up to 255 of its values from the top to the contract's
/// debug console. The values are positioned bottom-up: from the deepest value on the left
/// to the topmost value on the right. Evaluated only if the `debug` option
/// in the configuration file is set to `true`, otherwise does nothing.
///
/// ```tact
/// fun example() {
///     dumpStack(); // prints:
///                  // File filename.tact:1:1
///                  // dumpStack()
///                  // stack(3 values) : 100000000 C{96...C7} 0
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#dumpstack
/// * https://docs.tact-lang.org/book/config/#options-debug
///
fun dumpStack();

/// Computes and returns the SHA-256 hash as a 256-bit unsigned `Int`
/// from a passed `Slice` `data`, which should have a number of bits
/// divisible by 8 and no more than a single reference per the cell level.
///
/// This function tries to resolve constant string values at compile-time whenever possible.
///
/// ```tact
/// fun example() {
///     sha256(beginCell().asSlice());
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math/#sha256
///
fun sha256(data: Slice): Int;

/// Computes and returns the SHA-256 hash as a 256-bit unsigned `Int`
/// from a passed `String` `data`.
///
/// This function tries to resolve constant string values at compile-time whenever possible.
///
/// ```tact
/// fun example() {
///     sha256("Hello, world!");
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math/#sha256
///
fun sha256(data: String): Int;

/// Compile-time function.
///
/// Converts a `String` with an address into the `Address` type
/// and embeds it into the contract.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     addr: Address =
///         // Works at compile-time!
///         address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-comptime/#address
///
fun address(s: String): Address;

/// Compile-time function.
///
/// Embeds a base64-encoded BoC `bocBase64` as a `Cell` into the contract.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     stored: Cell =
///         // Init package for Wallet V3R1 as a base64-encoded BoC
///         cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA="); // works at compile-time!
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-comptime/#cell
///
fun cell(bocBase64: String): Cell;

/// Compile-time function. Available since Tact 1.5.0.
///
/// Embeds a base64-encoded BoC `bocBase64` as a `Slice` into the contract.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     stored: Slice =
///         // Works at compile-time!
///         slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="); // Hello world!
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-comptime/#slice
///
fun slice(bocBase64: String): Slice;

/// Compile-time function. Available since Tact 1.5.0.
///
/// Converts `hex` `String` with hex-encoded and optionally bit-padded
/// contents as a `Slice` and embeds it into the contract.
///
/// Contents are bit-padded if there's an underscore `_` at the very end of
/// `String`. The padding removes all the trailing zeros and the
/// last 1 bit before them:
///
/// ```tact
/// fun padding() {
///     // Not bit-padded
///     rawSlice("4a").loadUint(8); // 74, or 1001010 in binary
///
///     // Bit-padded
///     rawSlice("4a_").loadUint(6); // 18, or 10010 in binary
/// }
/// ```
///
/// Note that this function is limited and only allows to specify up to 1023 bits.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     stored: Slice =
///         rawSlice("000DEADBEEF000");  // CS{Cell{03f...430} bits: 588..644; refs: 1..1}
///     bitPadded: Slice =
///         rawSlice("000DEADBEEF000_"); // CS{Cell{03f...e14} bits: 36..79; refs: 0..0}
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-comptime/#rawslice
///
fun rawSlice(hex: String): Slice;

/// Compile-time function. Available since Tact 1.5.0.
///
/// Concatenates the hexadecimal values of the characters in `str` into one
/// and embeds the resulting `Int` into the contract. Only works for
/// strings that occupy up to 32 bytes, which allows to represent
/// up to 32 ASCII codes or up to 8 4-byte Unicode code points.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     a: Int = ascii("a");            // 97 or 0x61, one byte in total
///     zap: Int = ascii("⚡");         // 14850721 or 0xE29AA1, 3 bytes in total
///     doubleZap: Int = ascii("⚡⚡"); // 249153768823457 or 0xE29AA1E29AA1,
//                                      // 6 bytes in total
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-comptime/#ascii
///
fun ascii(str: String): Int;

/// Compile-time function. Available since Tact 1.5.0.
///
/// Computes a checksum using CRC-32 algorithm and embeds
/// the resulting `Int` value into the contract.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     checksum: Int = crc32("000DEADBEEF000"); // 1821923098
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-comptime/#crc32
///
fun crc32(str: String): Int;

/// Compile-time function.
///
/// Converts the given Toncoins `value` from a human-readable
/// format `String` to the nanoToncoin `Int` format.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     one: Int = ton("1");            // one Toncoin, which is equivalent to 10^9 nanoToncoins
///     pointOne: Int = ton("0.1");     // 0.1 Toncoin, which is equivalent to 10^8 nanoToncoins
///     nano: Int = ton("0.000000001"); // 10^-9 Toncoins, which is equivalent to 1 nanoToncoin
///                                     // works at compile-time!
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-comptime/#ton
///
fun ton(value: String): Int;

/// Pseudo-type that represents any Struct.
primitive AnyStruct;

/// Pseudo-type that represents any Message.
primitive AnyMessage;

/// Extension function for any Struct type.
///
/// Converts a `Cell` into the specified `Struct` and returns that `Struct`.
///
/// ```tact
/// struct GuessCoin {
///     probably: Int as coins;
///     nothing: Int as coins;
/// }
/// 
/// fun directParse(payload: Cell): GuessCoin {
///     return GuessCoin.fromCell(payload);
/// }
/// 
/// fun cautiousParse(payload: Cell): GuessCoin? {
///     let coin: GuessCoin? = null;
///     try {
///         coin = GuessCoin.fromCell(payload);
///     } catch (e) {
///         dump("Cell payload doesn't match GuessCoin Struct!");
///     }
///     return coin;
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to pass a `Cell` with a layout different
///   from the specified `Struct` or to load more data than `Cell` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells/#structfromcell
///
/// [exit code 9]: https://docs.tact-lang.org/book/exit-codes#9
/// 
fun AnyStruct_fromCell(cell: Cell): S;

/// Extension function for any Struct type.
///
/// Converts a `Slice` into the specified `Struct` and returns that `Struct`.
///
/// ```tact
/// struct GuessCoin {
///     probably: Int as coins;
///     nothing: Int as coins;
/// }
/// 
/// fun directParse(payload: Slice): GuessCoin {
///     return GuessCoin.fromSlice(payload);
/// }
/// 
/// fun cautiousParse(payload: Slice): GuessCoin? {
///     let coin: GuessCoin? = null;
///     try {
///         coin = GuessCoin.fromSlice(payload);
///     } catch (e) {
///         dump("Slice payload doesn't match GuessCoin Struct!");
///     }
///     return coin;
/// }
/// ```
/// 
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to pass a `Slice` with a layout different
///   from the specified `Struct` or to load more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells/#structfromslice
/// 
/// [exit code 9]: https://docs.tact-lang.org/book/exit-codes#9
/// 
fun AnyStruct_fromSlice(slice: Slice): S;

/// Extension function for any Message type.
///
/// Converts a `Cell` into the specified `Message` and returns that `Message`.
///
/// ```tact
/// message(0x777) TripleAxe {
///     prize: Int as uint32;
/// }
/// 
/// fun directParse(payload: Cell): TripleAxe {
///     return TripleAxe.fromCell(payload);
/// }
/// 
/// fun cautiousParse(payload: Cell): TripleAxe? {
///     let coin: TripleAxe? = null;
///     try {
///         coin = TripleAxe.fromCell(payload);
///     } catch (e) {
///         dump("Cell payload doesn't match TripleAxe Message!");
///     }
///     return coin;
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to pass a `Cell` with a layout different
///   from the specified `Message` or to load more data than `Cell` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells/#messagefromcell
///
/// [exit code 9]: https://docs.tact-lang.org/book/exit-codes#9
/// 
fun AnyMessage_fromCell(cell: Cell): M;

/// Extension function for any Message type.
///
/// Converts a `Slice` into the specified `Message` and returns that `Message`.
///
/// ```tact
/// message(0x777) TripleAxe {
///     prize: Int as uint32;
/// }
/// 
/// fun directParse(payload: Slice): TripleAxe {
///     return TripleAxe.fromSlice(payload);
/// }
/// 
/// fun cautiousParse(payload: Slice): TripleAxe? {
///     let coin: TripleAxe? = null;
///     try {
///         coin = TripleAxe.fromSlice(payload);
///     } catch (e) {
///         dump("Slice payload doesn't match TripleAxe Message!");
///     }
///     return coin;
/// }
/// ```
/// 
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to pass a `Slice` with a layout different
/// from the specified `Message` or to load more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells/#messagefromslice
/// 
/// [exit code 9]: https://docs.tact-lang.org/book/exit-codes#9
/// 
fun AnyMessage_fromSlice(slice: Slice): M;

/// Extension function for any Struct.
///
/// Converts the Struct to a `Cell` and returns it.
///
/// ```tact
/// struct GuessCoin {
///     probably: Int as coins;
///     nothing: Int as coins;
/// }
///
/// fun coinCell(): Cell {
///     let s: GuessCoin = GuessCoin{ probably: 42, nothing: 27 };
///     let fizz: Cell = s.toCell();
///
///     return fizz; // "x{12A11B}"
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells/#structtocell
///
extends fun toCell(self: AnyStruct): Cell;

/// Extension function for any Struct. Available since Tact 1.5.0.
///
/// Converts the Struct to a `Slice` and returns it. Alias to `self.toCell().asSlice()`.
///
/// ```tact
/// struct GuessCoin {
///     probably: Int as coins;
///     nothing: Int as coins;
/// }
///
/// fun coinSlice(): Slice {
///     let s: GuessCoin = GuessCoin{ probably: 42, nothing: 27 };
///     let fizz: Slice = s.toSlice();
///
///     return fizz; // "CS{Cell{000612a11b} bits: 0..24; refs: 0..0}"
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells/#structtoslice
///
extends fun toSlice(self: AnyStruct): Slice;

/// Extension function for any Message.
///
/// Converts the Message to a `Cell` and returns it.
///
/// ```tact
/// message GuessCoin {
///     probably: Int as coins;
///     nothing: Int as coins;
/// }
///
/// fun coinCell(): Cell {
///     let s: GuessCoin = GuessCoin{ probably: 42, nothing: 27 };
///     let fizz: Cell = s.toCell();
///
///     return fizz; // "x{AB37107712A11B}"
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells/#messagetocell
///
extends fun toCell(self: AnyMessage): Cell;

/// Extension function for any Message. Available since Tact 1.5.0.
///
/// Converts the Message to a `Slice` and returns it. Alias to `self.toCell().asSlice()`.
///
/// ```tact
/// message GuessCoin {
///     probably: Int as coins;
///     nothing: Int as coins;
/// }
///
/// fun coinSlice(): Slice {
///     let s: GuessCoin = GuessCoin{ probably: 42, nothing: 27 };
///     let fizz: Slice = s.toSlice();
///
///     return fizz; // "CS{Cell{000eab37107712a11b} bits: 0..56; refs: 0..0}"
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells/#messagetoslice
///
extends fun toSlice(self: AnyMessage): Slice;

/// Creates an empty map of type `map<K, V>`, initially set to `null`.
///
/// ```tact
/// fun example() {
///     let entries: map<Int, String> = emptyMap();
///     //           ^^^^^^^^^^^^^^^^ note that you need to specify the key and
///     //                            value types in the type annotation when
///     //                            declaring the map variable
/// }
/// ```
///
/// On TVM, maps are represented as a `Cell` type, which is very gas-intensive.
///
/// See: https://docs.tact-lang.org/book/maps/#emptymap
///
fun emptyMap(): map<K, V>;

/// Sets or replaces a value `val` under a `key` in the map.
///
/// See: https://docs.tact-lang.org/book/maps/#set
///
extends mutates fun set(self: map<K, V>, key: K, val: V);

/// Gets a value by its `key` from the map. Returns `null` if the `key` is missing,
/// or the value if the `key` is found.
///
/// See: https://docs.tact-lang.org/book/maps/#get
///
extends fun get(self: map<K, V>, key: K): V?;

/// Replaces a value `val` under the specified `key`
/// if such key exists. Returns `true` on successful replacement and `false` otherwise.
///
/// See: https://docs.tact-lang.org/book/maps/#replace
///
extends mutates fun replace(self: map<K, V>, key: K, val: V): Bool;

/// Like `replace()`, but returns the old (pre-replacement) value
/// on successful replacement and `null` otherwise.
///
/// See: https://docs.tact-lang.org/book/maps/#replaceget
///
extends mutates fun replaceGet(self: map<K, V>, key: K, val: V): V?;

/// Deletes a single key-value pair (single entry) by its `key`
/// from the map. Returns `true` in case of successful deletion and `false` otherwise.
///
/// See: https://docs.tact-lang.org/book/maps/#del
///
extends mutates fun del(self: map<K, V>, key: K): Bool;

/// Returns `true` if the value under the given `key` exists in the map and `false` otherwise.
///
/// This function is more gas-efficient than checking `self.get(key) != null`.
///
/// See: https://docs.tact-lang.org/book/maps/#exists
///
extends fun exists(self: map<K, V>, key: K): Bool;

/// Returns `true` if the map is empty and `false` otherwise.
///
/// See: https://docs.tact-lang.org/book/maps/#isempty
///
extends fun isEmpty(self: map<K, V>): Bool;

/// Returns `true` if all entries of the map match corresponding entries of another map,
/// ignoring possible differences in the underlying serialization logic. Returns `false` otherwise.
///
/// This function is very gas expensive, prefer `==` operator for simple comparisons.
///
/// See: https://docs.tact-lang.org/book/maps/#deepequals
///
extends fun deepEquals(self: map<K, V>, other: map<K, V>): Bool;

/// Converts the map to its underlying `Cell` representation.
///
/// Since maps are initialized to `null`, calling `asCell()` on a map
/// with no values assigned will return `null` and **not** an empty `Cell`.
///
/// See: https://docs.tact-lang.org/book/maps/#ascell
///
extends fun asCell(self: map<K, V>): Cell?;
