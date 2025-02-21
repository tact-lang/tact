/// Global function. Available since Tact 1.6.0.
///
/// Computes and returns an `Int` value of the SHA-256 hash of the `code` and `data` of the given contract. To assemble the `code` and `data` cells together for hashing, the standard `Cell` representation is used.
///
/// This hash is commonly called account ID. Together with the workchain ID it deterministically forms the address of the contract on TON Blockchain.
///
/// ```tact
/// fun example() {
///     let initPkg: StateInit = initOf SomeContract();
///     let accountId: Int = contractHash(initPkg.code, initPkg.data);
///     let basechainAddr: Address = newAddress(0, accountId);
///     let basechainAddr2: Address = contractAddressExt(0, initPkg.code, initPkg.data);
///
///     basechainAddr == basechainAddr2; // true
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-common#contracthash
/// * https://docs.tact-lang.org/ref/core-common#newaddress
/// * https://docs.tact-lang.org/ref/core-common#contractaddressext
///
asm fun contractHash(code: Cell, data: Cell): Int {
    // According to the https://docs.tact-lang.org/book/cells#cells-representation,
    // the layout for the Builder to hash goes as follows:
    // 1) refs_descriptor:bits8 | bits_descriptor:bits8 | data:bitsN
    //
    //  refs_descriptor: ref_count + ((exotic? & 1) * 8) + (mask * 32)
    //                   2 refs (code + data), non-exotic, zero-mask
    //
    //  bits_descriptor: floor(bit_count / 8) + ceil(bit_count, 8)
    //                   floor (5 bits / 8) + ceil(5 bits / 8) = 0 + 1 = 1
    //
    //  data: [0b00110] + [0b100] = [0b00110100] = 0x34 (data + augmented bits)
    //        0b00110 - data (split_depth, special, code, data, Library)
    //        0b100 - augmented bits (Leading 1 + zeroes to make section multiple of eight)
    //
    //  That is: (2 << 16) | (1 << 8) | 0x34 = 131380 for all three.
    //
    // 2) and 3) depth_descriptors: CDEPTH of `code` and CDEPTH of `data`
    // 4) and 5) ref hashes: HASHCU of `code` and HASHCU of `data`

    // Group 1: Computations and arrangements
    s0 PUSH HASHCU // `data` hash
    s2 PUSH HASHCU // `code` hash
    SWAP2
    CDEPTH         // `data` depth
    SWAP
    CDEPTH         // `code` depth
    131380 INT     // (2 << 16) | (1 << 8) | 0x34

    // Group 2: Composition of the Builder
    NEWC
    24 STU  // store refs_descriptor | bits_descriptor | data
    16 STU  // store depth_descriptor for `code`
    16 STU  // store depth_descriptor for `data`
    256 STU // store `code` hash
    256 STU // store `data` hash

    // Group 3: SHA256 hash of the resulting Builder
    ONE HASHEXT_SHA256
}

/// Global function.
///
/// Computes smart contract's `Address` in the `chain` ID using the contract's `code` and the contract's initial state `data`. Use the `initOf` expression to obtain the initial `code` and initial `data` of a given contract.
///
/// This function tries to resolve constant values in compile-time whenever possible.
///
/// Attempts to specify an invalid `chain` ID (not -1 or 0) that can be detected in compile-time will result in a compilation error.
///
/// ```tact
/// fun example() {
///     let initPkg: StateInit = initOf SomeContract();
///     let hereBeDragons: Address = contractAddressExt(0, initPkg.code, initPkg.data);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-common#contractaddressext
/// * https://docs.tact-lang.org/book/expressions#initof
///
inline fun contractAddressExt(chain: Int, code: Cell, data: Cell): Address {
    let hash = contractHash(code, data);
    return newAddress(chain, hash);
}

/// Struct containing the initial state, i.e. initial code and initial data of the given contract upon its deployment.
///
/// See: https://docs.tact-lang.org/book/expressions#initof
///
struct StateInit {
    /// Initial code of the contract (compiled bitcode)
    code: Cell;

    /// Initial data of the contract (parameters of `init()` function)
    data: Cell;
}

/// Global function.
///
/// Computes smart contract's `Address` in the workchain ID 0 (basechain) using the `StateInit` `s` of the contract. Alias to `contractAddressExt(0, s.code, s.data)`.
///
/// ```tact
/// fun example() {
///     let s: StateInit = initOf SomeContract();
///     let foundMeSome: Address = contractAddress(s);
///     let andSomeMore: Address = contractAddressExt(0, s.code, s.data);
///
///     foundMeSome == andSomeMore; // true
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-common#contractaddress
/// * https://docs.tact-lang.org/ref/core-common#contractaddressext
/// * https://docs.tact-lang.org/book/expressions#initof
///
inline fun contractAddress(s: StateInit): Address {
    return contractAddressExt(0, s.code, s.data);
}

/// Global function.
///
/// Returns the address of the current smart contract as an `Address`.
///
/// ```tact
/// fun example() {
///     let meMyselfAndI: Address = myAddress();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-common#myaddress
///
asm fun myAddress(): Address { MYADDR }

/// Global function.
///
/// Returns the nanoToncoin `Int` balance of the smart contract as it was at the start of the compute phase of the current transaction.
///
/// ```tact
/// fun example() {
///     let iNeedADolla: Int = myBalance();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-common#mybalance
///
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
