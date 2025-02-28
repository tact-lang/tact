/// Extension function for the `Slice` type. Available since Tact 1.6.0.
///
/// Casts the `Slice` to an `Address` in a given `chain` ID and returns it. The inverse of `Address.asSlice()` and a safe but more gas-expensive version of `Slice.asAddressUnsafe()`.
///
/// Attempts to specify a slice with an invalid account ID length throw an error with exit code 136: `Invalid standard address`.
///
/// Attempts to specify a slice with an invalid tag prefix (not `0b100`) or with an invalid account ID length (not 256 bits) throw an error with exit code 136: `Invalid standard address`.
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
/// See:
/// * https://docs.tact-lang.org/ref/core-cells#sliceasaddress
/// * https://docs.tact-lang.org/ref/core-cells#sliceasaddressunsafe
/// * https://docs.tact-lang.org/ref/core-cells#addressasslice
///
extends fun asAddress(self: Slice, chain: Int): Address {
    // 11 bits for the prefix,
    // 256 bits for the address itself
    throwUnless(136, self.bits() == 267);

    if (chain == -1) {
        // 1279 = 0b100_1111_1111,
        // i.e. internal address prefix and chain ID -1
        throwUnless(136, self.preloadUint(11) == 1279);
    } else {
        // Only check the correct internal address prefix,
        // but do not verify the chain ID
        throwUnless(136, self.preloadUint(3) == 4);
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
/// * https://docs.tact-lang.org/ref/core-cells#addressasslice
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
/// * https://docs.tact-lang.org/ref/core-cells#addressasslice
/// * https://docs.tact-lang.org/ref/core-cells#sliceasaddressunsafe
///
asm extends fun asSlice(self: Address): Slice {}

/// Global function.
///
/// Creates a new `Address` based on the `chain` ID and the SHA-256 encoded `hash` value (account ID).
///
/// This function tries to resolve constant values in compile-time whenever possible.
///
/// Attempts to specify an invalid `chain` ID (not -1 or 0) that can be detected in compile-time will result in a compilation error.
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
/// See: https://docs.tact-lang.org/ref/core-common#newaddress
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
/// * https://docs.tact-lang.org/ref/core-advanced#parsestdaddress
/// * https://github.com/ton-blockchain/ton/blob/master/crypto/block/block.tlb#L105-L106
///
struct StdAddress {
    workchain: Int as int8;
    address: Int as uint256;
}

/// Struct representing the address of variable length with signed 32-bit `workchain` ID and a `Slice` containing unsigned `address` in the specified `workchain`. Available since Tact 1.5.0.
///
/// Variable-length addresses are intended for future extensions, and while validators must be ready to accept them in inbound messages, the standard (non-variable) addresses are used whenever possible.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#parsevaraddress
/// * https://github.com/ton-blockchain/ton/blob/master/crypto/block/block.tlb#L107-L108
///
struct VarAddress {
    workchain: Int as int32;
    address: Slice;
}

/// Global function. Available since Tact 1.5.0.
///
/// Converts a `slice` containing an address into the `StdAddress` Struct and returns it.
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
/// See: https://docs.tact-lang.org/ref/core-advanced#parsestdaddress
///
asm fun parseStdAddress(slice: Slice): StdAddress { REWRITESTDADDR }

/// Global function. Available since Tact 1.5.0.
///
/// Converts a `slice` containing an address of variable length into the `VarAddress` Struct and returns it.
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
/// See: https://docs.tact-lang.org/ref/core-advanced#parsevaraddress
///
asm fun parseVarAddress(slice: Slice): VarAddress { REWRITEVARADDR }

/// Extension mutation function for the `Slice` type.
///
/// Loads and returns an `Address` from the `Slice`.
///
/// Attempts to load such `Address` when `Slice` doesn't contain it throw an exception with exit code 8: `Cell overflow`.
///
/// Attempts to load more data than `Slice` contains throw an exception with exit code 9: `Cell underflow`.
///
/// ```tact
/// fun example() {
///     let s: Slice = beginCell().storeAddress(myAddress()).asSlice();
///     let fizz: Address = s.loadAddress();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells/#sliceloadaddress
///
asm( -> 1 0) extends mutates fun loadAddress(self: Slice): Address { LDMSGADDR }

/// Extension function for the `Builder` type.
///
/// Stores the `address` in the copy of the `Builder`. Returns that copy.
///
/// Attempts to store an `address` into the `Builder` `self`, if `self` cannot fit it, throw an exception with exit code 8: `Cell overflow`.
///
/// ```tact
/// fun example() {
///     let b: Builder = beginCell();
///     let fizz: Builder = b.storeAddress(myAddress());
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells/#builderstoreaddress
///
asm extends fun storeAddress(self: Builder, address: Address): Builder { STSLICER }

/// Struct representing a basechain address. Available since Tact 1.6.0.
///
/// A basechain address (workchain 0) can be either empty (null hash) or contain a 256-bit hash value.
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
inline fun emptyBasechainAddress(): BasechainAddress {
    return BasechainAddress { hash: null }
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
inline fun newBasechainAddress(hash: Int): BasechainAddress {
    return BasechainAddress { hash }
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
inline fun contractBasechainAddress(s: StateInit): BasechainAddress {
    let hash = contractHash(s.code, s.data);
    return newBasechainAddress(hash);
}

/// Extension function for the `Builder` type. Available since Tact 1.6.0.
///
/// Stores the basechain address in the copy of the Builder and returns that copy.
///
/// If the address has a `null` hash, stores 0b00 (`addr_none`). Otherwise, stores the full address
/// with prefix 0b100 followed by workchain (0) and the 256-bit hash.
///
/// ```tact
/// fun example() {
///     let addr: BasechainAddress = newBasechainAddress(0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
///     let b: Builder = beginCell();
///     let b2: Builder = b.storeBasechainAddress(addr);
/// }
/// ```
///
extends fun storeBasechainAddress(self: Builder, address: BasechainAddress): Builder {
    if (address.hash == null) {
        return self.storeUint(0, 2); // 0b00
    }

    return self
        .storeUint(0b10_0_00000000, 3 + 8)
        .storeUint(address.hash!!, 256);
}
