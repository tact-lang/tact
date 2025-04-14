/// Calculates and returns an `Int` value of the [SHA-256] hash of the
/// [standard `Cell` representation][std-representation] of the given `Cell`.
///
/// ```tact
/// fun example() {
///     let c: Cell = emptyCell();
///     let fizz: Int = c.hash();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#cellhash
///
/// [SHA-256]: https://en.wikipedia.org/wiki/SHA-2#Hash_standard
/// [std-representation]: https://docs.tact-lang.org/book/cells#cells-representation
///
asm extends fun hash(self: Cell): Int { HASHCU }

/// Calculates and returns an `Int` value of the [SHA-256] hash of the
/// [standard `Slice` representation][std-representation] of the given `Slice`.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().asSlice();
///     let fizz: Int = s.hash();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicehash
///
/// [SHA-256]: https://en.wikipedia.org/wiki/SHA-2#Hash_standard
/// [std-representation]: https://docs.tact-lang.org/book/cells#cells-representation
///
asm extends fun hash(self: Slice): Int { HASHSU }

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Calculates and returns an `Int` value of the SHA-256 hash of the data bits from the given `Slice`, which should have a number of bits divisible by 8.
///
/// Unlike `sha256()`, this function is gas-efficient and **only** hashes the data of the given `Slice`, i.e. up to 1023 bits, ignoring the refs.
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
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to specify a `Slice` with number of bits **not** divisible by 8.
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicehashdata
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends fun hashData(self: Slice): Int { ONE HASHEXT_SHA256 }

/// Extension function for the `String` type. Available since Tact 1.6.0.
///
/// Calculates and returns an `Int` value of the SHA-256 hash of the data bits from the given `String`, which should have a number of bits divisible by 8.
///
/// Unlike `sha256()`, this function is gas-efficient and **only** hashes up to 127 bytes of the given string. Using longer strings would cause collisions if their first 127 bytes are the same.
///
/// ```tact
/// fun example() {
///     let roll: Int = "Never gonna give you up!".hashData(); // just the hash of the data
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to specify a `String` with number of bits **not** divisible by 8.
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringhashdata
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends fun hashData(self: String): Int { ONE HASHEXT_SHA256 }

/// Checks the [Ed25519] `signature` of the 256-bit unsigned `Int` `hash` using a `publicKey`,
/// represented by a 256-bit unsigned `Int`. The signature must contain at least 512 bits of data, but
/// only the first 512 bits are used.
///
/// Returns `true` if the signature is valid, `false` otherwise.
///
/// ```tact
/// message ExtMsg {
///     signature: Slice;
///     data: Cell;
/// }
///
/// contract Showcase {
///     /// Persistent state variables
///     pub: Int as uint256; // public key as a 256-bit unsigned Int
///
///     /// Constructor function init(), where all variables are initialized
///     init(pub: Int) {
///         self.pub = pub; // storing the public key upon contract initialization
///     }
///
///     /// External message receiver, which accepts message ExtMsg
///     external(msg: ExtMsg) {
///         let hash: Int = beginCell().storeRef(msg.data).endCell().hash();
///         let check: Bool = checkSignature(hash, msg.signature, self.pub);
///         //                               ----  -------------  --------
///         //                               ↑     ↑              ↑
///         //                               |     |              publicKey stored in our contract
///         //                               |     signature obtained from the received message
///         //                               hash calculated using the data from the received message
///         // ... follow-up logic ...
///     }
/// }
/// ```
///
/// NOTE: The first 10 calls of this function are very cheap regarding gas usage. However,
/// the 11th call and onward consume more than 4 thousand gas units.
///
/// See: https://docs.tact-lang.org/ref/core-crypto#checksignature
///
/// [Ed25519]: https://en.wikipedia.org/wiki/EdDSA#Ed25519
///
asm fun checkSignature(hash: Int, signature: Slice, publicKey: Int): Bool { CHKSIGNU }

/// Checks the [Ed25519] `signature` of the `data` using a `publicKey`, similar to `checkSignature()`.
/// Verification itself is done indirectly on a [SHA-256] hash of the `data`.
///
/// Returns `true` if the signature is valid, `false` otherwise.
///
/// ```tact
/// fun example() {
///     let data: Slice = someData;
///     let signature: Slice = someSignature;
///     let publicKey: Int = 42;
///
///     let check: Bool = checkDataSignature(data, signature, publicKey);
/// }
/// ```
///
/// NOTE: The first 10 calls of this function are very cheap regarding gas usage. However,
/// the 11th call and onward consume more than 4 thousand gas units.
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when the bit length of `data` is **not** divisible by 8.
///
/// See: https://docs.tact-lang.org/ref/core-crypto#checkdatasignature
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
/// [Ed25519]: https://en.wikipedia.org/wiki/EdDSA#Ed25519
/// [SHA-256]: https://en.wikipedia.org/wiki/SHA-2#Hash_standard
///
asm fun checkDataSignature(data: Slice, signature: Slice, publicKey: Int): Bool { CHKSIGNS }

/// A struct that contains a 512-bit [Ed25519] signature and the data it signs.
///
/// ```tact
/// message MessageWithSignedData {
///     // The `bundle.signature` contains the 512-bit Ed25519 signature
///     // of the remaining data fields of this message struct,
///     // while `bundle.signedData` references those data fields.
///     // In this case, the fields are `walletId` and `seqno`.
///     bundle: SignedBundle;
///
///     // These fields are common to external messages to user wallets.
///     walletId: Int as int32;
///     seqno: Int as uint32;
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-crypto#signedbundle
/// * https://docs.tact-lang.org/ref/core-crypto#signedbundleverifysignature
///
/// [Ed25519]: https://en.wikipedia.org/wiki/EdDSA#Ed25519
///
struct SignedBundle {
    /// A 512-bit Ed25519 signature of the `signedData`.
    signature: Slice as bytes64;

    /// The remaining non-serialized data of the enclosing struct or message struct,
    /// which was used to obtain the 512-bit Ed25519 `signature`.
    signedData: Slice as remaining;
}

/// Extension function for the `SignedBundle` struct. Available since Tact 1.6.6.
///
/// Checks whether `self.signedData` was signed by the 512-bit [Ed25519] signature `self.signature`,
/// using the given `publicKey`. Returns `true` if the signature is valid, `false` otherwise.
///
/// ```tact
/// contract Example(publicKey: Int as uint256) {
///     external(msg: MessageWithSignedData) {
///         // Checks that the signature of the SignedBundle from the incoming external
///         // message wasn't forged and made by the owner of this self.publicKey with
///         // its respective private key managed elsewhere.
///         throwUnless(35, msg.bundle.verifySignature(self.publicKey));
///
///         // ...rest of the checks and code...
///     }
/// }
///
/// message MessageWithSignedData {
///     // The `bundle.signature` contains the 512-bit Ed25519 signature
///     // of the remaining data fields of this message struct,
///     // while `bundle.signedData` references those data fields.
///     // In this case, the fields are `walletId` and `seqno`.
///     bundle: SignedBundle;
///
///     // These fields are common to external messages to user wallets.
///     walletId: Int as int32;
///     seqno: Int as uint32;
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-crypto#signedbundleverifysignature
///
/// [Ed25519]: https://en.wikipedia.org/wiki/EdDSA#Ed25519
///
inline extends fun verifySignature(self: SignedBundle, publicKey: Int): Bool {
    return checkSignature(self.signedData.hash(), self.signature, publicKey);
}

/// Normalizes the recovery ID `v` to be compatible with TVM `ecrecover`, which expects `v` to be `0` or `1`.
///
/// In Ethereum and Bitcoin, the recovery ID is often stored with a prefix:
/// * Ethereum / Bitcoin: `v = 27` or `28` → recovery ID = `v - 27`
/// * Bitcoin compact signatures: `v >= 31`, where:
///   - bits 0-1: recovery ID (0 to 3)
///   - bit 2: public key compression flag (ignored by `ecrecover`)
///
/// This function extracts the correct recovery ID (`0` or `1`) from such variants.
///
/// ```tact
/// fun example() {
///     let v: Int = 31; // Bitcoin compact format: 0x1F = recoveryId=0, compressed=true
///     let normalized: Int = normalizeECDSARecoveryId(v);
///     ecrecover(..., normalized, ...);
/// }
/// ```
///
/// Throws if `v` is not in a recognized format.
///
/// #### Exit codes
///
/// * 134: [Invalid argument] — Thrown when `v` is not in a recognized format.
///
/// See:
/// * [Bitcoin SE – What is V](https://bitcoin.stackexchange.com/questions/38351/ecdsa-v-r-s-what-is-v)
/// * [Ethereum Yellow Paper, Appendix F](https://ethereum.github.io/yellowpaper/paper.pdf)
inline fun normalizeECDSARecoveryId(v: Int): Int {
    if (v == 0 || v == 1) {
        return v;
    }
    if (v == 27 || v == 28) {
        return v - 27;
    }
    if (v >= 31) {
        // Bitcoin compact signature format: recovery ID is stored in the lowest 2 bits
        let recoveryId: Int = v & 3;
        if (recoveryId > 1) {
            throw(TactExitCodeInvalidArgument);
        }
        return recoveryId;
    }

    throw(TactExitCodeInvalidArgument);
}

/// Represents the public key returned by `ecrecover()` on success.
///
/// The format mimics a decompressed ECDSA public key, consisting of:
/// * `h`: 8-bit prefix (usually `0x04` for uncompressed keys)
/// * `x1`, `x2`: 256-bit coordinates of the point on the elliptic curve
struct EcrecoverKey {
    h: Int as uint8;
    x1: Int as uint256;
    x2: Int as uint256;
}

/// Recovers a public key from a given ECDSA signature as done in Ethereum or Bitcoin.
///
/// * `hash`: 256-bit message hash
/// * `v`: recovery ID (must be `0` or `1`, use `normalizeECDSARecoveryId()` to convert from `27`/`28`)
/// * `r`, `s`: 256-bit signature values
///
/// Returns `null` on failure or an `EcrecoverKey` structure on success.
///
/// Note: This function uses the TVM `ECRECOVER` instruction and therefore requires `v` to
/// be already normalized with [`normalizeECDSARecoveryId()`](#normalizeecdsarecoveryid).
asm fun ecrecover(hash: Int, v: Int, r: Int, s: Int): EcrecoverKey? {
    ECRECOVER
    NOT
    <{
        PUSHNULL
    }> PUSHCONT
    <{
        3 TUPLE
    }> PUSHCONT
    IFELSE
}
