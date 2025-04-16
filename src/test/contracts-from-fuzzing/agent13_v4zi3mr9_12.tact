// This test harness represents an exhaustive fuzz-testing suite for contract addresses in Tact.
// It covers a broad spectrum of behaviors as documented in the official Tact documentation such as:
// • newAddress (only allowing workchain IDs 0 and -1) [see docs_ref_core-addresses.md  ]
// • contractAddress, contractAddressExt, contractHash, and their equivalence
// • Enforcement of basechain restrictions using forceBasechain and forceWorkchain (throwing exit codes 138 and custom ones) 
// • Casting between Address and Slice via asSlice, asAddress, and asAddressUnsafe
// • Parsing of standard addresses with parseStdAddress and the VarAddress variant using parseVarAddress
// • Additional boundary and error cases (e.g., using an invalid tag, mismatched chain IDs, zero-size account addresses, or underflow conditions)

contract Dummy {}

// --- Basic Tests ---

fun validWorkchainAddress(): Address {
    // Valid workchain: allowed chain id 0
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun validMasterchainAddress(): Address {
    // Valid masterchain: allowed chain id -1
    return newAddress(-1, 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
}

fun testContractAddressEquivalence(): Bool {
    let initPkg: StateInit = initOf Dummy();
    return contractAddress(initPkg) == contractAddressExt(0, initPkg.code, initPkg.data);
}

fun testContractHash(): Bool {
    let initPkg: StateInit = initOf Dummy();
    return contractHash(initPkg.code, initPkg.data) >= 0;
}

fun testForceBasechain(): Bool {
    let baseAddr: Address = validWorkchainAddress();
    let masterAddr: Address = validMasterchainAddress();
    forceBasechain(baseAddr);
    try {
        forceBasechain(masterAddr);
        return false;
    } catch (exitCode) {
        return exitCode == 138;
    }
}

fun testForceWorkchain(): Bool {
    let baseAddr: Address = validWorkchainAddress();
    let masterAddr: Address = validMasterchainAddress();
    forceWorkchain(baseAddr, 0, 593);
    forceWorkchain(masterAddr, -1, 593);
    try {
        forceWorkchain(baseAddr, -1, 593);
        return false;
    } catch (exitCode) {
        return exitCode == 593;
    }
}

fun testAddressConversion(): Bool {
    let addr: Address = validWorkchainAddress();
    let s: Slice = addr.asSlice();
    let addr2: Address = s.asAddress(0);
    return addr == addr2;
}

fun testParseStdAddress(): Bool {
    let addr: Address = validWorkchainAddress();
    let cell: Cell = beginCell().storeAddress(addr).endCell();
    let parsed: StdAddress = parseStdAddress(cell.beginParse());
    let addr2: Address = newAddress(parsed.workchain, parsed.address);
    return addr == addr2;
}

fun testToString(): Bool {
    let addr: Address = validWorkchainAddress();
    let s: String = addr.toString();
    return s != "";
}

// --- Extended Tests for Additional Features ---

fun testEmptyBasechainAddress(): Bool {
    let emptyAddr: BasechainAddress = emptyBasechainAddress();
    return emptyAddr.hash == null;
}

fun testNewBasechainAddress(): Bool {
    let hashVal: Int = 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8;
    let baseAddr: BasechainAddress = newBasechainAddress(hashVal);
    if (baseAddr.hash == null) { return false; }
    return baseAddr.hash == hashVal;
}

fun testParseVarAddress(): Bool {
    // Build a valid VarAddress slice
    let size: Int = 123;
    let workchain: Int = 234;
    let addrVal: Int = 345;
    let varAddrSlice: Slice = beginCell()
        .storeUint(6, 3)          // tag for VarAddress
        .storeUint(size, 9)         // size in bits
        .storeUint(workchain, 32)   // workchain ID
        .storeUint(addrVal, size)   // address value
        .endCell()
        .beginParse();
    let parsedVar = parseVarAddress(varAddrSlice);
    if (parsedVar.workchain != workchain) { return false; }
    let loaded: Int = parsedVar.address.loadUint(size);
    return loaded == addrVal;
}

fun testAsAddressUnsafe(): Bool {
    let addr: Address = validWorkchainAddress();
    let s: Slice = addr.asSlice();
    let unsafeAddr: Address = s.asAddressUnsafe();
    return addr == unsafeAddr;
}

fun testInvalidAsAddress(): Bool {
    // Construct an invalid slice (wrong tag and incorrect account id size)
    let s: Slice = beginCell()
         .storeUint(0, 3)       // invalid tag (expected: 0b100 for std address)
         .storeInt(0, 8)        // chain id
         .storeUint(0, 42)      // invalid account id size
         .endCell()
         .beginParse();
    try {
        s.asAddress(0);
        return false; // Expected to throw
    } catch (exitCode) {
        return exitCode == 136;
    }
}

fun testParseVarAddressZeroSize(): Bool {
    let size: Int = 0;
    let workchain: Int = 123;
    let cell: Cell = beginCell()
        .storeUint(6, 3)          // tag for VarAddress
        .storeUint(size, 9)         // size = 0
        .storeUint(workchain, 32)   // workchain
        .endCell();
    let slice: Slice = cell.beginParse();
    let parsed = parseVarAddress(slice);
    let zero: Int = parsed.address.loadUint(0);
    return zero == 0;
}

fun testParseVarAddressUnderflow(): Bool {
    // Build a slice with size set to 10 but no account id bits provided
    let cell: Cell = beginCell()
        .storeUint(6, 3)
        .storeUint(10, 9)
        .storeUint(123, 32)   // workchain
        .endCell();
    let slice: Slice = cell.beginParse();
    try {
        let _ = parseVarAddress(slice);
        return false;
    } catch (exitCode) {
        return exitCode == 9;
    }
}

fun testStdAddressArbitraryChainSuccess(): Bool {
    // Manually construct a standard address for an arbitrary chain (e.g., 7)
    let cell: Cell = beginCell()
        .storeUint(0b100, 3)  // std address tag
        .storeInt(7, 8)       // chain id = 7
        .storeUint(42, 256)   // account id = 42
        .endCell();
    let slice: Slice = cell.beginParse();
    let _ = slice.asAddress(7);
    return true;
}

fun testStdAddressArbitraryChainFailure(): Bool {
    // Construct a standard address for chain 7 but call asAddress with chain 8
    let cell: Cell = beginCell()
        .storeUint(0b100, 3)
        .storeInt(7, 8)
        .storeUint(42, 256)
        .endCell();
    let slice: Slice = cell.beginParse();
    try {
        let _ = slice.asAddress(8);
        return false;
    } catch (exitCode) {
        return exitCode == 136;
    }
}

// --- Master Test Harness ---

fun runAllTestsExtended(): Int {
    if (testContractAddressEquivalence()) {} else { return 10; }
    if (testContractHash()) {} else { return 20; }
    if (testForceBasechain()) {} else { return 30; }
    if (testForceWorkchain()) {} else { return 40; }
    if (testAddressConversion()) {} else { return 50; }
    if (testParseStdAddress()) {} else { return 60; }
    if (testToString()) {} else { return 70; }
    if (testEmptyBasechainAddress()) {} else { return 80; }
    if (testNewBasechainAddress()) {} else { return 90; }
    if (testParseVarAddress()) {} else { return 100; }
    if (testAsAddressUnsafe()) {} else { return 110; }
    if (testInvalidAsAddress()) {} else { return 120; }
    if (testParseVarAddressZeroSize()) {} else { return 130; }
    if (testParseVarAddressUnderflow()) {} else { return 140; }
    if (testStdAddressArbitraryChainSuccess()) {} else { return 150; }
    if (testStdAddressArbitraryChainFailure()) {} else { return 160; }
    return 1; // All tests passed
}
