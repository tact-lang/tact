contract SomeContract {}

// Test 12: Verify contractHash produces the same address as contractAddress
fun testContractHash(): Bool {
    let s: StateInit = initOf SomeContract();
    let h: Int = contractHash(s.code, s.data);
    let addr1: Address = newAddress(0, h);
    let addr2: Address = contractAddress(s);
    return addr1 == addr2;
}

// Test 13: Parse a valid VarAddress from an explicitly constructed Builder
fun testParseVarAddressValid(): Bool {
    // Construct a valid VarAddress:
    // - tag: 6 (3 bits)
    // - address length: 9 bits
    // - workchain: 0 (32 bits)
    // - account id: 42 (9 bits)
    let b: Builder = beginCell()
        .storeUint(6, 3)   // VarAddress tag
        .storeUint(9, 9)   // number of bits for address
        .storeInt(0, 32)   // workchain = 0
        .storeUint(42, 9); // account id = 42
    let s: Slice = b.asSlice();
    let varAddr = parseVarAddress(s);
    return (varAddr.workchain == 0) && (varAddr.address.loadUint(9) == 42);
}

// Test 14: Attempt to parse an invalid VarAddress (should throw exit code 9: Cell underflow)
fun testParseVarAddressInvalid(): Bool {
    // Provide an incomplete VarAddress: only the tag
    let b: Builder = beginCell().storeUint(6, 3);
    let s: Slice = b.asSlice();
    try {
         let _ = parseVarAddress(s);
         return false; // Should not succeed
    } catch (exitCode) {
         return (exitCode == 9);
    }
}

// Test 15: Validate StateInit.hasSameBasechainAddress
fun testStateInitHasSameBasechainAddress(): Bool {
    let s: StateInit = initOf SomeContract();
    return s.hasSameBasechainAddress(contractAddress(s));
}

// Previously defined tests
fun testAsSliceEquality(a: Address): Bool {
    let s1: Slice = a.asSlice();
    let s2: Slice = beginCell().storeAddress(a).asSlice();
    return s1 == s2;
}

fun testAddressToString(a: Address): Bool {
    let s: String = a.toString();
    return s != "";
}

fun testForceBasechainValid(): Bool {
    let addr: Address = newAddress(0, 0x1234);
    forceBasechain(addr);
    return true;
}

fun testForceBasechainInvalid(): Bool {
    let addr: Address = newAddress(-1, 0x1234);
    try {
        forceBasechain(addr);
        return false;
    } catch (exitCode) {
        return (exitCode == 138);
    }
}

fun testForceWorkchainValid(): Bool {
    let addr: Address = newAddress(0, 0x5678);
    forceWorkchain(addr, 0, 593);
    let addrM: Address = newAddress(-1, 0x5678);
    forceWorkchain(addrM, -1, 593);
    return true;
}

fun testForceWorkchainInvalid(): Bool {
    let addr: Address = newAddress(0, 0x5678);
    try {
        forceWorkchain(addr, -1, 593);
        return false;
    } catch (exitCode) {
        return (exitCode == 593);
    }
}

fun testParseStdAddress(a: Address): Bool {
    let b: Builder = beginCell().storeAddress(a);
    let s: Slice = b.asSlice();
    let stdAddr = parseStdAddress(s);
    let recAddr: Address = newAddress(stdAddr.workchain, stdAddr.address);
    return recAddr == a;
}

fun testEmptyAndNewBasechain(): Bool {
    let empty: BasechainAddress = emptyBasechainAddress();
    let nonEmpty: BasechainAddress = newBasechainAddress(0xdeadbeef);
    return (empty.hash == null) && (nonEmpty.hash != null);
}

// Aggregate function to run all tests. It takes an Address 'a' (for tests that require one) and
// returns true if all tests pass.
fun runAllTests(a: Address): Bool {
    return testContractHash()
        && testParseVarAddressValid()
        && testParseVarAddressInvalid()
        && testStateInitHasSameBasechainAddress()
        && testAsSliceEquality(a)
        && testAddressToString(a)
        && testForceBasechainValid()
        && testForceBasechainInvalid()
        && testForceWorkchainValid()
        && testForceWorkchainInvalid()
        && testParseStdAddress(a)
        && testEmptyAndNewBasechain();
}
