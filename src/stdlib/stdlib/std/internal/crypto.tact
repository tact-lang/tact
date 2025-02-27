asm extends fun hash(self: Cell): Int { HASHCU }

asm extends fun hash(self: Slice): Int { HASHSU }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Calculates and returns an `Int` value of the SHA-256 hash of the data bits from the given `Slice`, which should have a number of bits divisible by 8.
///
/// Unlike `sha256()`, this function is gas-efficient and **only** hashes the data of the given `Slice`, i.e. up to 1023 bits, ignoring the refs.
///
/// Attempts to specify a `Slice` with number of bits **not** divisible by 8 throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun examples() {
///     // Base64-encoded BoC with "Hello, World!"
///     let short: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
///
///     // It's enough to only take the hash of the data
///     sha256(short) == short.hashData(); // true
///
///     // But if we construct a slice larger than 1023 bits with all refs combined,
///     // we must use sha256() or we'll get skewed results or even collisions
///
///     let tmp: Builder = beginCell();
///     repeat (127) { tmp = tmp.storeUint(69, 8) } // storing 127 bytes
///     let ref: Cell = beginCell().storeUint(33, 8).endCell();
///     let long: Slice = tmp.storeRef(ref).asSlice(); // plus a ref with a single byte
///
///     // Hashing just the data bits in the current slice isn't enough
///     sha256(long) == long.hashData(); // false!
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells/#slicehashdata
///
asm extends fun hashData(self: Slice): Int { ONE HASHEXT_SHA256 }

/// Extension function for the `String` type. Available since Tact 1.6.0.
///
/// Calculates and returns an `Int` value of the SHA-256 hash of the data bits from the given `String`, which should have a number of bits divisible by 8.
///
/// Unlike `sha256()`, this function is gas-efficient and **only** hashes up to 127 bytes of the given string. Using longer strings would cause collisions if their first 127 bytes are the same.
///
/// Attempts to specify a `String` with number of bits **not** divisible by 8 throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let roll: Int = "Never gonna give you up!".hashData(); // just the hash of the data
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells/#stringhashdata
///
asm extends fun hashData(self: String): Int { ONE HASHEXT_SHA256 }

asm fun checkSignature(hash: Int, signature: Slice, public_key: Int): Bool { CHKSIGNU }

asm fun checkDataSignature(data: Slice, signature: Slice, public_key: Int): Bool { CHKSIGNS }
