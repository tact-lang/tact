inline fun newAddress(chain: Int, hash: Int): Address {
    return beginCell()
        .storeUint(2, 2)
        .storeUint(0, 1)
        .storeInt(chain, 8)
        .storeInt(hash, 256)
        .endCell()
        .asSlice()
        .toAddressUnsafe();
}

asm extends fun toAddressUnsafe(self: Slice): Address { NOP }
asm extends fun asSlice(self: Address): Slice { NOP }

inline fun contractAddressExt(chain: Int, code: Cell, data: Cell): Address {
    let hash = beginCell()
        .storeUint(0, 2)
        .storeUint(3, 2)
        .storeUint(0, 1)
        .storeRef(code)
        .storeRef(data)
        .endCell()
        .hash();
    return newAddress(chain, hash);
}

struct StateInit {
    code: Cell;
    data: Cell;
}

inline fun contractAddress(s: StateInit): Address {
    return contractAddressExt(0, s.code, s.data);
}

asm fun myAddress(): Address { MYADDR }

asm fun myBalance(): Int { BALANCE FIRST }

/// Global function. Available since Tact 1.5.0.
///
/// Returns the nanoToncoin `Int` amount of gas consumed by TVM in the current transaction so far. The resulting value includes the cost of calling this function.
///
/// ```tact
/// fun example() {
///     let gas: Int = gasConsumed();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-advanced#gasconsumed
///
asm fun gasConsumed(): Int { GASCONSUMED }

/// Global function. Available since Tact 1.5.0.
///
/// Returns the nanoToncoin `Int` amount of the accumulated storage fee debt. Storage fees are deducted from the incoming message value before the new contract balance is calculated.
///
/// ```tact
/// fun example() {
///     let debt: Int = myStorageDue();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-advanced#mystoragedue
///
asm fun myStorageDue(): Int { DUEPAYMENT }

/// Global function. Available since Tact 1.5.0.
///
/// Calculates and returns the storage fee in nanoToncoins `Int` for storing a contract with a given number of `cells` and `bits` for a number of `seconds`. Uses the prices of the masterchain if `isMasterchain` is `true`, otherwise the prices of the basechain. The current prices are obtained from the config param 18 of TON Blockchain.
///
/// Note, that specifying values of `cells` and `bits` higher than their maximum values listed in account state limits (`max_acc_state_cells` and `max_acc_state_bits`) will have the same result as with specifying the exact limits. In addition, make sure you take into account the deduplication of cells with the same hash.
///
/// Attempts to specify negative number of `cells`, `bits` or `seconds` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let fee: Int = getStorageFee(1_000, 1_000, 1_000, false);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#getstoragefee
/// * https://docs.tact-lang.org/ref/core-advanced#getsimplestoragefee
///
asm fun getStorageFee(cells: Int, bits: Int, seconds: Int, isMasterchain: Bool): Int { GETSTORAGEFEE }

/// Global function. Available since Tact 1.5.0.
///
/// Calculates and returns the compute fee in nanoToncoins `Int` for a transaction that consumed `gasUsed` amount of gas. Uses the prices of the masterchain if `isMasterchain` is `true`, otherwise the prices of the basechain. The current prices are obtained from the config param 20 for the masterchain and config param 21 for the basechain of TON Blockchain.
///
/// When the `gasUsed` is less than a certain threshold called `flat_gas_limit`, there's a minimum price to pay based on the value of `flat_gas_price`. The less gas is used below this threshold, the higher the minimum price will be. See the example for `getSimpleComputeFee()` to derive that threshold.
///
/// Attempts to specify negative value of `gasUsed` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let fee: Int = getComputeFee(1_000, false);
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-advanced#getcomputefee
///
asm fun getComputeFee(gasUsed: Int, isMasterchain: Bool): Int { GETGASFEE }

/// Global function. Available since Tact 1.5.0.
///
/// Similar to `getComputeFee()`, but without the `flat_gas_price`, i.e. without a minimum price to pay if the `gasUsed` is less than a certain threshold called `flat_gas_limit`. Calculates and returns only the `gasUsed` times the current gas price.
///
/// Attempts to specify negative number of `cells`, `bits` or `seconds` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let fee = getComputeFee(0, false);
///     let feeNoFlat = getSimpleComputeFee(0, false);
///     let maxFlatPrice = fee - feeNoFlat;
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#getsimplestoragefee
/// * https://docs.tact-lang.org/ref/core-advanced#getstoragefee
///
asm fun getSimpleComputeFee(gasUsed: Int, isMasterchain: Bool): Int { GETGASFEESIMPLE }

/// Global function. Available since Tact 1.5.0.
///
/// Calculates and returns the forward fee in nanoToncoins `Int` for an outgoing message consisting of a given number of `cells` and `bits`. Uses the prices of the masterchain if `isMasterchain` is `true{:tact}`, otherwise the prices of the basechain. The current prices are obtained from the config param 24 for the masterchain and config param 25 for the basechain of TON Blockchain.
///
/// If both the source and the destination addresses are in the basechain, then specify `isMasterchain` as `false`. Otherwise, specify `true`.
///
/// Note, that specifying values of `cells` and `bits` higher than their maximum values listed in account state limits (`max_msg_cells` and `max_msg_bits`) will have the same result as with specifying the exact limits.
///
/// However, regardless of the values of `cells` and `bits`, this function always adds the minimum price based on the value of `lump_price`. See the example for [`getSimpleForwardFee(){:tact}`](#getsimpleforwardfee) to derive it. In addition, make sure you take into account the deduplication of cells with the same hash, since for example the root cell and its data bits don't count towards the forward fee and are covered by the `lump_price`.
///
/// Attempts to specify negative number of `cells` or `bits` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let fee: Int = getForwardFee(1_000, 1_000, false);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#getforwardfee
/// * https://docs.tact-lang.org/ref/core-advanced#getsimpleforwardfee
/// * https://docs.tact-lang.org/ref/core-advanced#getoriginalfwdfee
///
asm fun getForwardFee(cells: Int, bits: Int, isMasterchain: Bool): Int { GETFORWARDFEE }

/// Global function. Available since Tact 1.5.0.
///
/// Similar to `getForwardFee()`, but without the `lump_price`, i.e. without the minimum price to pay regardless of the amount of `cells` or `bits`. Calculates and returns only the `cells` times the current cell price plus `bits` times the current bit price.
///
/// Attempts to specify negative number of `cells` or `bits` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let fee = getForwardFee(1_000, 1_000, false);
///     let feeNoLump = getSimpleForwardFee(1_000, 1_000, false);
///     let lumpPrice = fee - feeNoLump;
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#getsimpleforwardfee
/// * https://docs.tact-lang.org/ref/core-advanced#getforwardfee
///
asm fun getSimpleForwardFee(cells: Int, bits: Int, isMasterchain: Bool): Int { GETFORWARDFEESIMPLE }

/// Global function. Available since Tact 1.5.0.
///
/// Calculates and returns the so-called _original_ forward fee in nanoToncoins `Int` for an outgoing message based on the `fwdFee` obtained from the incoming message. If both the source and the destination addresses are in the basechain, then specify `isMasterchain` as `false`. Otherwise, specify `true`.
///
/// This function is useful when the outgoing message depends heavily on the structure of the incoming message, so much so that you cannot fully predict the fee using `getForwardFee()` alone. Even if you could, calculating the exact fee with nanoToncoin-level precision can be very expensive, so the approximate value given by this function is often good enough.
///
/// Attempts to specify a negative value of `fwdFee` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let fwdFee: Int = context().readForwardFee();
///     let origFee: Int = getOriginalFwdFee(fee, false);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#getoriginalfwdfee
/// * https://docs.tact-lang.org/ref/core-advanced#getforwardfee
/// * https://docs.tact-lang.org/ref/core-advanced#contextreadforwardfee
///
asm fun getOriginalFwdFee(fwdFee: Int, isMasterchain: Bool): Int { GETORIGINALFWDFEE }

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

/// Assembly function. Available since Tact 1.5.0.
///
/// Converts a `Slice` containing an address into the `StdAddress` Struct and returns it.
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

/// Assembly function. Available since Tact 1.5.0.
///
/// Converts a `Slice` containing an address of variable length into the `VarAddress` Struct and returns it.
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

/// Global function. Available since Tact 1.6.0.
///
/// Returns the `Int` value of the logical time of the current transaction.
///
/// ```tact
/// fun example() {
///     let lt: Int = curLt();
///     nativeRandomize(lt); // equivalent to calling nativeRandomizeLt()
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#curlt
/// * https://docs.tact-lang.org/ref/core-advanced#nativerandomize
/// * https://docs.tact-lang.org/ref/core-advanced#nativerandomizelt
///
asm fun curLt(): Int { LTIME }

/// Global function. Available since Tact 1.6.0.
///
/// Returns the `Int` value of the starting logical time of the current block.
///
/// ```tact
/// fun example() {
///     let time: Int = blockLt();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-advanced#blocklt
///
asm fun blockLt(): Int { BLOCKLT }

/// Global function. Available since Tact 1.6.0.
///
/// Sets the `gas_limit` to the `Int` `limit` and resets the `gas_credit` to 0. Note that specifying the `limit` higher than the maximum allowed value of 2^63 - 1 will have the same result as with specifying that exact maximum or calling `acceptMessage()`.
///
/// Attempts to specify a negative or insufficient value of `limit` will cause an exception with exit code -14: `Out of gas error`.
///
/// ```tact
/// fun example() {
///     setGasLimit(42000);
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-advanced#setgaslimit
///
asm fun setGasLimit(limit: Int) { SETGASLIMIT }

/// Global function. Available since Tact 1.6.0.
///
/// Generates and returns an unsigned 256-bit `Int` seed for the random number generator. The resulting seed is commonly used with the `setSeed()` and `nativeRandomize()` functions.
///
/// ```tact
/// fun example() {
///     let seed: Int = getSeed();
///     setSeed(seed); // from now on the results of pseudorandom number generator
///                    // are completely determined by the seed, which can be handy in tests,
///                    // but must not be used in production code!
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#getseed
/// * https://docs.tact-lang.org/ref/core-advanced#setseed
/// * https://docs.tact-lang.org/ref/core-advanced#nativerandomize
///
asm fun getSeed(): Int { RANDSEED }

/// Global function. Available since Tact 1.6.0.
///
/// Sets the seed of the random number generator to the unsigned 256-bit `Int` `seed` which can be obtained with the `getSeed()` function.
///
/// Attempts to specify a negative value of `seed` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     let seed: Int = getSeed();
///     setSeed(seed); // from now on the results of pseudorandom number generator
///                    // are completely determined by the seed, which can be handy in tests,
///                    // but must not be used in production code!
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#setseed
/// * https://docs.tact-lang.org/ref/core-advanced#getseed
///
asm fun setSeed(seed: Int) { SETRAND }

/// Global function. Available since Tact 1.6.0.
///
/// Returns the smart contract code `Cell` obtained from the `c7` register.
///
/// ```tact
/// fun example() {
///     let code: Cell = myCode();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-advanced#mycode
///
asm fun myCode(): Cell { MYCODE }
