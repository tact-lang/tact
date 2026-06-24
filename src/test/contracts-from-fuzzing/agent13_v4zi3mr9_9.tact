contract Dummy {}

// --- Previously Tested Functions ---

fun validWorkchainAddress(): Address {
    // Valid workchain address: chain id 0
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun validMasterchainAddress(): Address {
    // Valid masterchain address: chain id -1
    return newAddress(-1, 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
}

fun testContractAddressEquivalence(): Bool {
    let initPkg: StateInit = initOf Dummy();
    return contractAddress(initPkg) == contractAddressExt(0, initPkg.code, initPkg.data);
}

fun testContractHash(): Bool {
    let initPkg: StateInit = initOf Dummy();
    // contractHash should be non-negative
    return contractHash(initPkg.code, initPkg.data) >= 0;
}

fun testForceBasechain(): Bool {
    let baseAddr: Address = validWorkchainAddress();
    let masterAddr: Address = validMasterchainAddress();
    forceBasechain(baseAddr);
    try {
        forceBasechain(masterAddr);
        return false; // Should have thrown
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
        return false; // Should have thrown
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

// --- New Tests for Additional Address Features ---

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
    // Build a slice representing a VarAddress
    // Layout: 3 bits tag (use value 6), 9 bits size, 32 bits workchain, then [size] bits for address value
    let size: Int = 123;
    let workchain: Int = 234;
    let addrVal: Int = 345;
    let varAddrSlice: Slice = beginCell()
        .storeUint(6, 3)          // tag for VarAddress
        .storeUint(size, 9)         // size of the address in bits
        .storeUint(workchain, 32)   // workchain ID
        .storeUint(addrVal, size)   // address value
        .endCell()
        .beginParse();
    let parsedVar = parseVarAddress(varAddrSlice);
    if (parsedVar.workchain != workchain) { return false; }
    // Load the value from parsedVar.address using the specified size
    let loaded: Int = parsedVar.address.loadUint(size);
    return loaded == addrVal;
}

fun testAsAddressUnsafe(): Bool {
    let addr: Address = validWorkchainAddress();
    let s: Slice = addr.asSlice();
    let unsafeAddr: Address = s.asAddressUnsafe();
    return addr == unsafeAddr;
}

// Combine all tests into one master function without using the '!' operator in conditions
fun runAllTests(): Int {
    if (testContractAddressEquivalence()) {
    } else { return 10; }
    if (testContractHash()) {
    } else { return 20; }
    if (testForceBasechain()) {
    } else { return 30; }
    if (testForceWorkchain()) {
    } else { return 40; }
    if (testAddressConversion()) {
    } else { return 50; }
    if (testParseStdAddress()) {
    } else { return 60; }
    if (testToString()) {
    } else { return 70; }
    if (testEmptyBasechainAddress()) {
    } else { return 80; }
    if (testNewBasechainAddress()) {
    } else { return 90; }
    if (testParseVarAddress()) {
    } else { return 100; }
    if (testAsAddressUnsafe()) {
    } else { return 110; }
    return 1; // All tests passed
}
