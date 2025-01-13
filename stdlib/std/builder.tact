/// Builder is an immutable primitive to construct cells.
///
/// This type is immutable, so all its methods return a new `Builder` with the updated state.
/// This means that you should reassign the result of the method to a variable with builder
/// to correctly use it in subsequent calls.
///
/// # Example
/// ```
/// let b = beginCell();
/// b = b.storeBit(true);
/// b = b.storeBit(false);
/// let cell = b.endCell(); // cell with -1 and 0 ints
/// ```
///
/// But usually, store methods are used in a chain, where the final method 
/// is `endCell()` or `endSlice()`.
///
/// # Example
/// ```
/// let cell = beginCell()
///    .storeBit(true)
///    .storeBit(false)
///    .endCell(); // cell with -1 and 0 ints
/// ```
primitive Builder;

/// Creates a new empty builder.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeBit(true).endCell();
/// ```
asm fun beginCell(): Builder { NEWC }

/// Converts a builder into an ordinary `Cell`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeBit(true).endCell();
/// ```
asm extends fun endCell(self: Builder): Cell { ENDC }

/// Stores a reference to a cell into a builder, and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let firstCell = b.storeInt16(-1).endCell();
/// let secondCell = b.storeUint(1, 16).endCell();
///
/// let finalCell = b
///     .storeRef(firstCell)
///     .storeRef(secondCell)
///     .endCell(); // cell with two references
/// ```
asm(cell self) extends fun storeRef(self: Builder, cell: Cell): Builder { STREF }

/// Stores a signed [`len`]-bit integer into a builder (`0 ≤ len ≤ 257`), 
/// and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeInt(-1, 16).endCell(); // cell with 16-bit signed integer -1
/// ```
@name(store_int)
extends native storeInt(self: Builder, value: Int, bits: Int): Builder;

/// Stores an unsigned [`len`]-bit integer into a builder (`0 ≤ len ≤ 256`),
/// and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeUint(1, 32).endCell(); // cell with 32-bit unsigned integer 1
/// ```
@name(store_uint)
extends native storeUint(self: Builder, value: Int, bits: Int): Builder;

/// Stores a boolean value (-1 for true, 0 for false) into a builder,
/// and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeBool(true).endCell(); // cell with -1 int
/// ```
@name(__tact_store_bool)
extends native storeBool(self: Builder, value: Bool): Builder;

/// Stores a boolean value (-1 for true, 0 for false) into a builder,
/// and returns the resulting `Builder`. Alias to `Builder.storeBool()`.
///
/// @since 1.5.0
///
/// # Example
/// ```
/// let b = beginCell();
/// let fizz = b.storeBit(true);  // writes -1
/// let buzz = b.storeBit(false); // writes 0
/// ```
@name(__tact_store_bool)
extends native storeBit(self: Builder, value: Bool): Builder;

/// Stores amount of Toncoins into a builder, and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeCoins(ton("0.01")).endCell(); // cell with 0.01 Toncoins
/// ```
asm extends fun storeCoins(self: Builder, value: Int): Builder { STVARUINT16 }

/// Stores a value in the range `-2^119...2^119-1` into a builder, and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeVarInt16(2 * 10000 * 1457351).endCell(); // cell with some big number
/// ```
asm extends fun storeVarInt16(self: Builder, value: Int): Builder { STVARINT16 }

/// Stores a value in the range `-2^247...2^247-1` into a builder, and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeVarInt32(-2 * 10000 * 1457351).endCell(); // cell with some big negative number
/// ```
asm extends fun storeVarInt32(self: Builder, value: Int): Builder { STVARINT32 }

/// Stores a unsigned value in the range `0...2^120-1` into a builder, and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeVarUint16(2 * 10000 * 1457351).endCell(); // cell with some big number
/// ```
asm extends fun storeVarUint16(self: Builder, value: Int): Builder { STVARUINT16 }

/// Stores a unsigned value in the range `0...2^248-1` into a builder, and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeVarUint32(2 * 10000 * 1457351).endCell(); // cell with some big number
/// ```
asm extends fun storeVarUint32(self: Builder, value: Int): Builder { STVARUINT32 }

/// Stores a slice into a builder, and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let firstSlice = b.storeInt16(-1).asSlice();
/// let secondSlice = b.storeUint(1, 16).asSlice();
///
/// let finalCell = b
///     .storeSlice(firstSlice)
///     .storeSlice(secondSlice)
///     .endCell(); // cell with two slices
/// ```
asm extends fun storeSlice(self: Builder, slice: Slice): Builder { STSLICER }

/// Appends all data from a `Builder` [`cell`] to the copy of the `Builder`,
/// and returns that copy.
///
/// @since 1.5.0
///
/// # Example
/// ```
/// let b = beginCell().storeCoins(42);
/// let fizz = beginCell().storeBuilder(b);
/// b.endCell() == fizz.endCell(); // true
/// ```
asm extends fun storeBuilder(self: Builder, other: Builder): Builder { STBR }

/// Stores an address into a builder and returns the resulting `Builder`.
///
/// # Example
/// ```
/// let addr = newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873)
/// let b = beginCell();
/// let cell = b.storeAddress(addr).endCell();
/// ```
@name(__tact_store_address)
extends native storeAddress(self: Builder, address: Address): Builder;

/// Stores an optional reference to a cell into a builder, and returns the resulting `Builder`.
///
/// If the `cell` is not `null`, stores 1 as a single bit, then reference `cell` into 
/// the copy of the `Builder` and returns that copy.
///
/// If the `cell` is `null`, only stores 0 as a single bit into the copy of the `Builder` 
/// and returns that copy.
///
/// As a single `Cell` can store up to 4 references, attempts to store more throw an exception 
/// with exit code 8: `Cell overflow`.
///
/// @since 1.5.0
///
/// # Example
/// ```
/// let b = beginCell();
/// let fizz = b
///     .storeMaybeRef(emptyCell()) // 1, then empty cell
///     .storeMaybeRef(null);       // 0
/// ```
asm(cell self) extends fun storeMaybeRef(self: Builder, cell: Cell?): Builder { STOPTREF }

/// Returns the number of references stored in the `Builder`.
///
/// # Example
/// ```
/// let b = beginCell();
/// let cell = b.storeRef(emptyCell()).storeRef(emptyCell()).endCell();
/// b.refs() == 2; // true
/// ```
asm extends fun refs(self: Builder): Int { BREFS }

/// Returns the number of bits stored in the `Builder`.
///
/// # Example
/// ```
/// let b = beginCell().storeBit(true).storeBit(false).storeBit(true);
/// b.bits() == 3; // true
/// ```
asm extends fun bits(self: Builder): Int { BBITS }
