contract Dummy {}

// Comprehensive fuzz-testing of contract address related functionalities.

// Test 1: Verify that parseVarAddress correctly parses a variable-length address from a constructed cell
fun test_parseVarAddress(): Bool {
    // Setup a cell as per documentation instructions for VarAddress:
    // - storeUint(6, 3) marks the cell as containing a VarAddress
    // - storeUint(123, 9) indicates that the address occupies 123 bits
    // - storeUint(234, 32) stores the workchain ID
    // - storeUint(345, 123) stores the actual address value
    let varAddrSlice: Slice = beginCell()
        .storeUint(6, 3)
        .storeUint(123, 9)
        .storeUint(234, 32)
        .storeUint(345, 123)
        .asSlice();
    let varAddr = parseVarAddress(varAddrSlice);
    return varAddr.workchain == 234 && varAddr.address.loadUint(123) == 345;
}

// Test 2: Verify that storeBasechainAddress works by storing a BasechainAddress in a Builder
fun test_storeBasechainAddress(): Bool {
    let bc: BasechainAddress = newBasechainAddress(0xabcdef);
    let b: Builder = beginCell();
    let _ = b.storeBasechainAddress(bc);
    return true; // success if no error thrown
}

// Test 3: Ensure that addresses created with different chain IDs yield different string representations
fun test_address_string_different(): Bool {
    let addrBase: Address = newAddress(0, 0xabcdef);
    let addrMaster: Address = newAddress(-1, 0xabcdef);
    return addrBase.toString() != addrMaster.toString();
}

// Test 4: Force a builder overflow by consuming nearly all bits in a cell then trying to store an address
fun test_builder_overflow(): Bool {
    let b: Builder = beginCell().storeUint(0, 1014); // leave only 9 bits free
    try {
        b.storeAddress(newAddress(0, 0xabcdef));
        return false;
    } catch (exitCode) {
        return exitCode == 8; // 8: Cell overflow
    }
}

// Test 5: Verify that contractAddress and contractAddressExt produce identical addresses
fun test_address_consistency(): Bool {
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2;
}

// Test 6: Test parseVarAddress with an underflow scenario (insufficient data in the cell)
fun test_parseVarAddress_underflow(): Bool {
    let shortSlice: Slice = beginCell()
        .storeUint(6, 3)      // VarAddress marker
        .storeUint(123, 9)    // Partially storing the length
        .asSlice();
    try {
        let _ = parseVarAddress(shortSlice);
        return false;
    } catch (exitCode) {
        return exitCode == 9; // 9: Cell underflow
    }
}

// Test 7: Verify newBasechainAddress works for large hash values
fun test_newBasechainAddress_large(): Bool {
    let largeHash: Int = 0xFFFFFFFFFFFFFFFF;
    let bc: BasechainAddress = newBasechainAddress(largeHash);
    return bc.hash == largeHash;
}

// Test 8: Check roundtrip conversion using asSlice and asAddressUnsafe
fun test_address_roundtrip(): Bool {
    let a: Address = newAddress(0, 0xabcdef);
    let slice: Slice = beginCell().storeAddress(a).asSlice();
    let a2: Address = slice.asAddressUnsafe();
    return a == a2;
}

// Test 9: Test forceWorkchain with a valid basechain address
fun test_forceWorkchain_valid(): Bool {
    let addr: Address = newAddress(0, 0xabcdef);
    forceWorkchain(addr, 0, 0);  // Note: forceWorkchain requires 3 arguments
    return true;
}

// Test 10: Test forceWorkchain with an invalid (non-basechain) address
fun test_forceWorkchain_invalid(): Bool {
    let addr: Address = newAddress(-1, 0xabcdef);
    try {
        forceWorkchain(addr, 0, 0);
        return false;
    } catch (exitCode) {
        return exitCode == 138;
    }
}

// Test 11: Test asAddressUnsafe with an invalid slice (should throw exit code 9)
fun test_asAddressUnsafe_invalid(): Bool {
    let s: Slice = beginCell().storeUint(0, 10).asSlice();
    try {
        let _ = s.asAddressUnsafe();
        return false;
    } catch (exitCode) {
        return exitCode == 9;
    }
}

// Test 12: Ensure that two addresses differing only in hash values are non-equal
fun test_address_inequality(): Bool {
    let addr1: Address = newAddress(0, 0xabcde1);
    let addr2: Address = newAddress(0, 0xabcde2);
    return addr1 != addr2;
}

// Test 13: Verify roundtrip conversion with extra padding bits does not affect address decoding
fun test_address_roundtrip_with_padding(): Bool {
    let a: Address = newAddress(0, 0xabcdef);
    let b: Builder = beginCell().storeAddress(a).storeUint(0, 10);
    let s: Slice = b.asSlice();
    let a2: Address = s.asAddressUnsafe();
    return a == a2;
}

// Test 14: Confirm that the undocumented forceWorkchain signature (3 parameters) persists
fun test_forceWorkchain_signature(): Bool {
    let addr: Address = newAddress(0, 0xabcdef);
    forceWorkchain(addr, 0, 0);
    return true;
}

// Aggregate all tests
fun runAllCombinedTests(): Bool {
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
        && test_forceWorkchain_signature();
}
