contract Dummy {}

// --- Previously defined tests from agent11_n404wyu9_12.tact ---

fun test_parseVarAddress(): Bool {
    let varAddrSlice: Slice = beginCell()
        .storeUint(6, 3)
        .storeUint(123, 9)
        .storeUint(234, 32)
        .storeUint(345, 123)
        .asSlice();
    let varAddr = parseVarAddress(varAddrSlice);
    return varAddr.workchain == 234 && varAddr.address.loadUint(123) == 345;
}

fun test_storeBasechainAddress(): Bool {
    let bc: BasechainAddress = newBasechainAddress(0xabcdef);
    let b: Builder = beginCell();
    let _ = b.storeBasechainAddress(bc);
    return true;
}

fun test_address_string_different(): Bool {
    let addrBase: Address = newAddress(0, 0xabcdef);
    let addrMaster: Address = newAddress(-1, 0xabcdef);
    return addrBase.toString() != addrMaster.toString();
}

fun test_builder_overflow(): Bool {
    let b: Builder = beginCell().storeUint(0, 1014);
    try {
        b.storeAddress(newAddress(0, 0xabcdef));
        return false;
    } catch (exitCode) {
        return exitCode == 8;
    }
}

fun test_address_consistency(): Bool {
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2;
}

fun test_parseVarAddress_underflow(): Bool {
    let shortSlice: Slice = beginCell()
        .storeUint(6, 3)
        .storeUint(123, 9)
        .asSlice();
    try {
        let _ = parseVarAddress(shortSlice);
        return false;
    } catch (exitCode) {
        return exitCode == 9;
    }
}

fun test_newBasechainAddress_large(): Bool {
    let largeHash: Int = 0xFFFFFFFFFFFFFFFF;
    let bc: BasechainAddress = newBasechainAddress(largeHash);
    return bc.hash == largeHash;
}

fun test_address_roundtrip(): Bool {
    let a: Address = newAddress(0, 0xabcdef);
    let slice: Slice = beginCell().storeAddress(a).asSlice();
    let a2: Address = slice.asAddressUnsafe();
    return a == a2;
}

fun test_forceWorkchain_valid(): Bool {
    let addr: Address = newAddress(0, 0xabcdef);
    forceWorkchain(addr, 0, 0);
    return true;
}

fun test_forceWorkchain_invalid(): Bool {
    let addr: Address = newAddress(-1, 0xabcdef);
    try {
        forceWorkchain(addr, 0, 0);
        return false;
    } catch (exitCode) {
        return exitCode == 138;
    }
}

fun test_asAddressUnsafe_invalid(): Bool {
    let s: Slice = beginCell().storeUint(0, 10).asSlice();
    try {
        let _ = s.asAddressUnsafe();
        return false;
    } catch (exitCode) {
        return exitCode == 9;
    }
}

fun test_address_inequality(): Bool {
    let addr1: Address = newAddress(0, 0xabcde1);
    let addr2: Address = newAddress(0, 0xabcde2);
    return addr1 != addr2;
}

fun test_address_roundtrip_with_padding(): Bool {
    let a: Address = newAddress(0, 0xabcdef);
    let b: Builder = beginCell().storeAddress(a).storeUint(0, 10);
    let s: Slice = b.asSlice();
    let a2: Address = s.asAddressUnsafe();
    return a == a2;
}

fun test_forceWorkchain_signature(): Bool {
    let addr: Address = newAddress(0, 0xabcdef);
    forceWorkchain(addr, 0, 0);
    return true;
}

// --- Additional new tests ---

// Test 15: Verify that StateInit.hasSameBasechainAddress works as advertised.
// It compares the basechain address embedded in a StateInit struct with a provided Address.
fun test_stateInit_hasSameBasechainAddress(): Bool {
    let s: StateInit = initOf Dummy();
    // Use contractAddress(s) as the expected basechain address since contractAddress computes it from s
    return s.hasSameBasechainAddress(contractAddress(s));
}

// Test 16: Verify consistency of contractHash: newAddress(0, contractHash(s.code, s.data)) should equal contractAddress(s)
fun test_contractHash_consistency(): Bool {
    let s: StateInit = initOf Dummy();
    let h: Int = contractHash(s.code, s.data);
    let addrFromHash: Address = newAddress(0, h);
    return addrFromHash == contractAddress(s);
}

// Aggregate all tests into one combined test function
fun runExtendedTests(): Bool {
    return test_parseVarAddress()
        && test_storeBasechainAddress()
        && test_address_string_different()
        && test_builder_overflow()
        && test_address_consistency()
        && test_parseVarAddress_underflow()
        && test_newBasechainAddress_large()
        && test_address_roundtrip()
        && test_forceWorkchain_valid()
        && test_forceWorkchain_invalid()
        && test_asAddressUnsafe_invalid()
        && test_address_inequality()
        && test_address_roundtrip_with_padding()
        && test_forceWorkchain_signature()
        && test_stateInit_hasSameBasechainAddress()
        && test_contractHash_consistency();
}
