struct StateInit {
    code: Cell;
    data: Cell;
}

@name(__tact_compute_contract_address)
native contractAddressExt(chain: Int, code: Cell, data: Cell): Address;

inline fun contractAddress(s: StateInit): Address {
    return contractAddressExt(0, s.code, s.data);
}

@name(__tact_address_to_slice)
extends native asSlice(self: Address): Slice;

@name(__tact_create_address)
native newAddress(chain: Int, hash: Int): Address;

asm fun myAddress(): Address { MYADDR }

asm fun myBalance(): Int { BALANCE FIRST }

// Returns gas consumed by VM so far (including this instruction).
asm fun gasConsumed(): Int { GASCONSUMED }

// Calculates computation cost in nanotons for transaction that consumes `gas_used` gas.
asm fun getComputeFee(gas_used: Int, is_masterchain: Bool): Int { GETGASFEE }

// Calculates storage fees in nanotons for contract based on current storage prices. `cells` and `bits` are the size of the AccountState (with deduplication, including root cell).
asm fun getStorageFee(cells: Int, bits: Int, seconds: Int, is_masterchain: Bool): Int { GETSTORAGEFEE }

// Calculates forward fees in nanotons for outgoing message. `is_masterchain` is true if the source or the destination is in masterchain, false if both are in basechain. Note, `cells` and `bits` in Message should be counted with account for deduplication and root-is-not-counted rules.
asm fun getForwardFee(cells: Int, bits: Int, is_masterchain: Bool): Int { GETFORWARDFEE }

// Calculates additional computation cost in nanotons for transaction that consumes additional `gas_used`. In other words, same as `getComputeFee`, but without flat price (just `(gas_used * price) / 2^16`).
asm fun getSimpleComputeFee(gas_used: Int, is_masterchain: Bool): Int { GETGASFEESIMPLE }

// Calculates additional forward cost in nanotons for message that contains additional `cells` and `bits`. In other words, same as `getForwardFee`, but without lump price (just `(bits*bit_price + cells*cell_price) / 2^16`).
asm fun getSimpleForwardFee(cells: Int, bits: Int, is_masterchain: Bool): Int { GETFORWARDFEESIMPLE }

// Calculate `fwd_fee * 2^16 / first_frac`. Can be used to get the original `fwd_fee` of the message (as replacement for hardcoded values) from `fwd_fee` parsed from incoming message. `is_masterchain` is true if the source or the destination is in masterchain, false if both are in basechain.
asm fun getOriginalFwdFee(fwd_fee: Int, is_masterchain: Bool): Int { GETORIGINALFWDFEE }

// Current debt for storage fee in nanotons.
asm fun myStorageDue(): Int { DUEPAYMENT }

/// Struct representing the standard address on TON Blockchain with signed 8-bit `workchain` ID and an unsigned 256-bit `address` in the specified `workchain`.
///
/// At the moment, only `workchain` IDs used on TON are 0 of the basechain and -1 of the masterchain.
///
/// @since Tact 1.5.0
/// @see https://docs.tact-lang.org/ref/core-advanced#parsestdaddress
/// @see https://github.com/ton-blockchain/ton/blob/master/crypto/block/block.tlb#L105-L106
///
struct StdAddress {
    workchain: Int as int8;
    address: Int as uint256;
}

/// Struct representing the address of variable length with signed 32-bit `workchain` ID and a `Slice` containing unsigned `address` in the specified `workchain`.
///
/// Variable-length addresses are intended for future extensions, and while validators must be ready to accept them in inbound messages, the standard (non-variable) addresses are used whenever possible.
///
/// @since Tact 1.5.0
/// @see https://docs.tact-lang.org/ref/core-advanced#parsevaraddress
/// @see https://github.com/ton-blockchain/ton/blob/master/crypto/block/block.tlb#L107-L108
///
struct VarAddress {
    workchain: Int as int32;
    address: Slice;
}

/// Converts a `Slice` containing an address into the `StdAddress` Struct and returns it.
///
/// ```tact
/// let addr = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
/// let parsedAddr = parseStdAddress(addr.asSlice());
///
/// parsedAddr.workchain; // 0
/// parsedAddr.address;   // 107...287
/// ```
///
/// @since Tact 1.5.0
/// @see https://docs.tact-lang.org/ref/core-advanced#parsestdaddress
///
asm fun parseStdAddress(slice: Slice): StdAddress { REWRITESTDADDR }

/// Converts a `Slice` containing an address of variable length into the `VarAddress` Struct and returns it.
///
/// ```tact
/// let varAddrSlice = beginCell()
///     .storeUint(6, 3)     // to recognize the following as a VarAddress
///     .storeUint(123, 9)   // make address occupy 123 bits
///     .storeUint(234, 32)  // specify workchain ID of 234
///     .storeUint(345, 123) // specify address of 345
///     .asSlice();
/// let parsedVarAddr = parseVarAddress(varAddrSlice);
///
/// parsedVarAddr.workchain;             // 234
/// parsedVarAddr.address;               // CS{Cell{002...2b3} bits: 44..167; refs: 0..0}
/// parsedVarAddr.address.loadUint(123); // 345
/// ```
///
/// @since Tact 1.5.0
/// @see https://docs.tact-lang.org/ref/core-advanced#parsevaraddress
///
asm fun parseVarAddress(slice: Slice): VarAddress { REWRITEVARADDR }
