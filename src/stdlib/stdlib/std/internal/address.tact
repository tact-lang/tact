/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Casts the `Slice` to an `Address` in a given `chain` ID and returns it. The inverse of `Address.asSlice()` and a safe but more gas-expensive version of `Slice.asAddressUnsafe()`.
///
/// ```tact
/// fun example() {
///     let a: Address = myAddress(); // let's assume we're in a basechain
///     let a2: Address = a.asSlice().asAddress(0); // so the chain ID is 0
///
///     a == a2; // true
/// }
/// ```
///
/// #### Exit codes
///
/// * 136: [Invalid standard address] — Thrown when the given `Slice` contains an invalid
///   tag prefix (not `0b100`) or an invalid account ID length (not 256 bits).
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceasaddress
/// * https://docs.tact-lang.org/ref/core-cells#sliceasaddressunsafe
/// * https://docs.tact-lang.org/ref/core-addresses#addressasslice
///
/// [Invalid standard address]: https://docs.tact-lang.org/book/exit-codes#136
///
extends fun asAddress(self: Slice, chain: Int): Address {
    // 11 bits for the prefix,
    // 256 bits for the address itself
    throwUnless(TactExitCodeInvalidStandardAddress, self.bits() == 267);

    if (chain == -1) {
        // 1279 = 0b100_1111_1111,
        // i.e. internal address prefix and chain ID -1
        throwUnless(TactExitCodeInvalidStandardAddress, self.preloadUint(11) == 1279);
    } else {
        // Only check the correct internal address prefix,
        // but do not verify the chain ID
        throwUnless(TactExitCodeInvalidStandardAddress, self.preloadUint(3) == 4);
    }

    // Proceed with the cast
    return self.asAddressUnsafe();
}

/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Unsafely casts the `Slice` to an `Address` and returns it. The inverse of `Address.asSlice()`.
///
/// This function does **not** perform any checks on the contents of the `Slice`.
///
/// ```tact
/// fun example() {
///     let a: Address = myAddress();
///     let a2: Address = a.asSlice().asAddressUnsafe();
///
///     a == a2; // true
/// }
/// ```
///
/// Use it only if you want to optimize the code for gas and can guarantee in advance that the `Slice` contains the data of an `Address`.
///
/// Otherwise, use a safer but more gas-expensive `Slice.asAddress()` function.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceasaddressunsafe
/// * https://docs.tact-lang.org/ref/core-cells#sliceasaddress
/// * https://docs.tact-lang.org/ref/core-addresses#addressasslice
///
asm extends fun asAddressUnsafe(self: Slice): Address {}

/// Extension function for the `Address` type.
///
/// Casts `self` back to the underlying `Slice` and returns it. The inverse of `Slice.asAddressUnsafe()`.
///
/// ```tact
/// fun example() {
///     let a: Address = myAddress();
///     let fizz: Slice = beginCell().storeAddress(a).asSlice();
///     let buzz: Slice = a.asSlice(); // cheap, unlike the previous statement
///
///     fizz == buzz; // true
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-addresses#addressasslice
/// * https://docs.tact-lang.org/ref/core-cells#sliceasaddressunsafe
///
asm extends fun asSlice(self: Address): Slice {}

/// Global function.
///
/// Creates a new `Address` based on the `chain` ID and the SHA-256 encoded `hash` value (account ID).
///
/// This function tries to resolve constant values in compile-time whenever possible.
///
/// Attempts to specify an uncommon `chain` ID (not -1 or 0) that can be detected in compile-time will result in a compilation error.
///
/// ```tact
/// fun example() {
///     let oldTonFoundationAddr: Address =
///         newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
///         //         ↑  ↑
///         //         |  sha-256 hash of contract's init package (StateInit)
///         //         chain id: 0 is a workchain, -1 is a masterchain
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-addresses#newaddress
///
inline fun newAddress(chain: Int, hash: Int): Address {
    return beginCell()
        .storeUint(0b10_0, 3)
        .storeInt(chain, 8)
        .storeUint(hash, 256)
        .endCell()
        .asSlice()
        .asAddressUnsafe();
}

/// Struct representing the standard address on TON Blockchain with signed 8-bit `workchain` ID and an unsigned 256-bit `address` in the specified `workchain`. Available since Tact 1.5.0.
///
/// At the moment, only `workchain` IDs used on TON are 0 of the basechain and -1 of the masterchain.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-addresses#parsestdaddress
/// * https://github.com/ton-blockchain/ton/blob/master/crypto/block/block.tlb#L105-L106
///
struct StdAddress {
    workchain: Int as int8;
    address: Int as uint256;
}

/// Deprecated since Tact 1.6.8. Any usages of this structure will be reported as an error.
///
/// Struct representing the address of variable length with signed 32-bit `workchain` ID and a `Slice` containing unsigned `address` in the specified `workchain`. Available since Tact 1.5.0.
///
/// Variable-length addresses are intended for future extensions, and while validators must be ready to accept them in inbound messages, the standard (non-variable) addresses are used whenever possible.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-addresses#parsevaraddress
/// * https://github.com/ton-blockchain/ton/blob/master/crypto/block/block.tlb#L107-L108
///
struct VarAddress {
    workchain: Int as int32;
    address: Slice;
}

/// Global function. Available since Tact 1.5.0.
///
/// Converts a `slice` containing an address into the `StdAddress` struct and returns it.
///
/// ```tact
/// fun example() {
///     let addr = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
///     let parsedAddr = parseStdAddress(addr.asSlice());
///
///     parsedAddr.workchain; // 0
///     parsedAddr.address;   // 107...287
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when the specified `slice` cannot be parsed as a `StdAddress`.
///
/// See: https://docs.tact-lang.org/ref/core-addresses#parsestdaddress
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm fun parseStdAddress(slice: Slice): StdAddress { REWRITESTDADDR }

/// Global function. Available since Tact 1.5.0.
///
/// Deprecated since Tact 1.6.8. Any usages of this function will be reported as an error.
///
/// Converts a `slice` containing an address of variable length into the `VarAddress` struct and returns it.
///
/// ```tact
/// fun example() {
///     let varAddrSlice = beginCell()
///         .storeUint(6, 3)     // to recognize the following as a VarAddress
///         .storeUint(123, 9)   // make address occupy 123 bits
///         .storeUint(234, 32)  // specify workchain ID of 234
///         .storeUint(345, 123) // specify address of 345
///         .asSlice();
///     let parsedVarAddr = parseVarAddress(varAddrSlice);
///
///     parsedVarAddr.workchain;             // 234
///     parsedVarAddr.address;               // CS{Cell{002...2b3} bits: 44..167; refs: 0..0}
///     parsedVarAddr.address.loadUint(123); // 345
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when the specified `slice` cannot be parsed as a `VarAddress`.
///
/// See: https://docs.tact-lang.org/ref/core-addresses#parsevaraddress
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm fun parseVarAddress(slice: Slice): VarAddress { REWRITEVARADDR }

/// Extension mutation function for the `Slice` type.
///
/// Loads and returns an `Address` from the `Slice`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeAddress(myAddress()).asSlice();
///     let fizz: Address = s.loadAddress();
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to load more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceloadaddress
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm(-> 1 0) extends mutates fun loadAddress(self: Slice): Address { LDMSGADDR }

/// Extension mutation function for the `Slice` type. Available since Tact 1.6.2.
///
/// Skips an `Address` from the `Slice`.
///
/// ```tact
/// fun example() {
///     let s1: Slice = beginCell()
///         .storeAddress(myAddress())
///         .storeUint(42, 32)
///         .asSlice();
///
///     s1.skipAddress();
///     let fizz: Int = s1.loadUint(32); // 42
/// }
/// ```
///
/// #### Exit codes
///
/// * 9: [Cell underflow] — Thrown when attempting to skip more data than `Slice` contains.
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceskipaddress
///
/// [Cell underflow]: https://docs.tact-lang.org/book/exit-codes#9
///
asm extends mutates fun skipAddress(self: Slice) { LDMSGADDR NIP }

/// Extension function for the `Builder` type.
///
/// Stores the `address` in the copy of the `Builder`. Returns that copy.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeAddress(myAddress());
/// }
/// ```
///
/// #### Exit codes
///
/// * 8: [Cell overflow] — Thrown when attempting to store an `address` into the `Builder` when it cannot fit it.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstoreaddress
///
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
asm extends fun storeAddress(self: Builder, address: Address): Builder { STSLICER }

/// Struct representing a basechain address. Available since Tact 1.6.0.
///
/// A basechain address (workchain 0) can be either empty (null hash) or contain a 256-bit hash value.
///
/// See: https://docs.tact-lang.org/ref/core-addresses#basechainaddress
///
struct BasechainAddress {
    hash: Int?;
}

/// Global function. Available since Tact 1.6.0.
///
/// Creates and returns an empty basechain address with a null hash.
///
/// When serialized, an empty basechain address is represented as `addr_none`.
///
/// ```tact
/// fun example() {
///     let emptyAddr: BasechainAddress = emptyBasechainAddress();
///     emptyAddr.hash == null; // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-addresses#emptybasechainaddress
///
inline fun emptyBasechainAddress(): BasechainAddress {
    return BasechainAddress { hash: null };
}

/// Global function. Available since Tact 1.6.0.
///
/// Creates and returns a new basechain address with the specified hash value.
///
/// ```tact
/// fun example() {
///     let addr: BasechainAddress = newBasechainAddress(0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-addresses#newbasechainaddress
///
inline fun newBasechainAddress(hash: Int): BasechainAddress {
    return BasechainAddress { hash };
}

/// Global function. Available since Tact 1.6.0.
///
/// Creates and returns a basechain address derived from a contract's `StateInit` (code and data).
///
/// ```tact
/// fun example() {
///     let code: Cell = loadCell(); // load contract code
///     let data: Cell = loadCell(); // load contract data
///     let state: StateInit = StateInit { code, data };
///     let addr: BasechainAddress = contractBasechainAddress(state);
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-addresses#contractbasechainaddress
///
inline fun contractBasechainAddress(s: StateInit): BasechainAddress {
    let hash = contractHash(s.code, s.data);
    return newBasechainAddress(hash);
}

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Stores the basechain address in the copy of the Builder and returns that copy.
///
/// If the address has a `null` hash, stores two zero bits `0b00` (`addr_none`). Otherwise,
/// stores the full address with the three-bit prefix `0b100`,
/// followed by the 8-bit workchain ID set to 0 and the 256-bit hash.
///
/// ```tact
/// fun example() {
///     let addr: BasechainAddress = newBasechainAddress(0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
///     let b: Builder = beginCell();
///     let b2: Builder = b.storeBasechainAddress(addr);
/// }
/// ```
///
/// #### Exit codes
///
/// * 8: [Cell overflow] — Thrown when attempting to store an `address` into the `Builder` when it cannot fit it.
///
/// See: https://docs.tact-lang.org/ref/core-cells#builderstorebasechainaddress
///
/// [Cell overflow]: https://docs.tact-lang.org/book/exit-codes#8
///
extends fun storeBasechainAddress(self: Builder, address: BasechainAddress): Builder {
    if (address.hash == null) {
        return self.storeUint(0, 2); // 0b00
    }

    return self
        .storeUint(0b10_0_00000000, 3 + 8)
        .storeUint(address.hash!!, 256);
}

/// Global function. Available since Tact 1.6.3.
///
/// Checks whether the `address` is in the basechain, i.e., its chain ID is 0.
///
/// ```tact
/// fun examples() {
///     let someBasechainAddress: Address =
///         newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
///
///     let someMasterchainAddress: Address =
///         newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
///
///     // Does not throw because the chain ID is 0
///     forceBasechain(someBasechainAddress);
///
///     try {
///         // Throws because the chain ID is -1 (masterchain)
///         forceBasechain(someMasterchainAddress);
///     } catch (exitCode) {
///         // exitCode is 138
///     }
/// }
/// ```
///
/// #### Exit codes
///
/// * 138: [Not a basechain address] — Thrown when the given `address` is not in the basechain (chain ID is not 0).
///
/// See: https://docs.tact-lang.org/ref/core-addresses#forcebasechain
///
/// [Not a basechain address]: https://docs.tact-lang.org/book/exit-codes#138
///
asm fun forceBasechain(address: Address) { REWRITESTDADDR DROP 138 THROWIF }

/// Global function. Available since Tact 1.6.4.
///
/// Checks whether the `address` is in the `workchain`, i.e., its chain ID is equal to `workchain`.
///
/// ```tact
/// fun examples() {
///     let someBasechainAddress: Address =
///         newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
///
///     let someMasterchainAddress: Address =
///         newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
///
///     // Does not throw because the chain ID matches workchain parameter
///     forceWorkchain(someBasechainAddress, 0, 593);
///     forceWorkchain(someMasterchainAddress, -1, 593);
///
///     try {
///         // Throws because the chain ID is 0 which doesn't match the workchain parameter, -1
///         forceWorkchain(someBasechainAddress, -1, 593);
///     } catch (exitCode) {
///         // exitCode is 593
///     }
/// }
/// ```
///
/// #### Exit codes
///
/// * `errorCode` — Thrown when the given `address` is not in the specified `workchain` (chain ID is not equal to `workchain`).
///
/// See: https://docs.tact-lang.org/ref/core-addresses#forceworkchain
///
asm(errorCode workchain address) fun forceWorkchain(address: Address, workchain: Int, errorCode: Int) {
    REWRITESTDADDR
    DROP
    CMP
    THROWANYIF
}
