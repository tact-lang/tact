contract Dummy {}

// Test 1: Verify that parseVarAddress correctly parses a variable-length address from a constructed cell
fun test_parseVarAddress(): Bool {
    // Setup a cell as per documentation instructions for VarAddress:
    // 1. storeUint(6, 3) marks the cell as containing a VarAddress
    // 2. storeUint(123, 9): indicates that the address occupies 123 bits
    // 3. storeUint(234, 32): stores the workchain ID (234)
    // 4. storeUint(345, 123): stores the actual address value
    let varAddrSlice: Slice = beginCell()
        .storeUint(6, 3)
        .storeUint(123, 9)
        .storeUint(234, 32)
        .storeUint(345, 123)
        .asSlice();
    let varAddr = parseVarAddress(varAddrSlice);
    return varAddr.workchain == 234 && varAddr.address.loadUint(123) == 345;
}

// Test 2: Verify that storeBasechainAddress works as intended by storing a BasechainAddress in a Builder
fun test_storeBasechainAddress(): Bool {
    let bc: BasechainAddress = newBasechainAddress(0xabcdef);
    let b: Builder = beginCell();
    let _ = b.storeBasechainAddress(bc);
    // No error implies success
    return true;
}

// Test 3: Check that addresses created with different chain IDs yield different string representations
fun test_address_string_different(): Bool {
    let addrBase: Address = newAddress(0, 0xabcdef);
    let addrMaster: Address = newAddress(-1, 0xabcdef);
    return addrBase.toString() != addrMaster.toString();
}

// Test 4: Force a builder overflow error by consuming nearly all bits in the cell then trying to store an address
fun test_builder_overflow(): Bool {
    // Normally a cell has about 1023 free bits; consume 1014 bits to leave only 9 free bits
    let b: Builder = beginCell().storeUint(0, 1014);
    try {
        b.storeAddress(newAddress(0, 0xabcdef));
        return false; // No exception thrown means test failure
    } catch (exitCode) {
        // Expect exit code 8 for cell overflow
        return exitCode == 8;
    }
}

// Test 5: Ensure that contractAddress and contractAddressExt produce consistent addresses as per documentation
fun test_address_consistency(): Bool {
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2;
}

// Test 6: Test parseVarAddress with underflow (insufficient bits in cell)
fun test_parseVarAddress_underflow(): Bool {
    // Construct a cell that is too short: only store the VarAddress header and part of the length field,
    // then try to parseVarAddress. This should throw an error due to cell underflow (expected exit code 9).
    let shortSlice: Slice = beginCell()
        .storeUint(6, 3)      // Mark as VarAddress
        .storeUint(123, 9)    // Intended bit-length is 123, but we won't store the rest.
        .asSlice();
    try {
        let _ = parseVarAddress(shortSlice);
        return false; // If no exception, test fails
    } catch (exitCode) {
        // Expecting exit code 9 for cell underflow
        return exitCode == 9;
    }
}

// Test 7: Verify newBasechainAddress works for large hash values
fun test_newBasechainAddress_large(): Bool {
    // Use a large value
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
    // forceWorkchain expects 3 arguments; using dummy extra parameters of 0
    forceWorkchain(addr, 0, 0);
    return true;
}

// Test 10: Test forceWorkchain with an invalid (non-basechain) address
fun test_forceWorkchain_invalid(): Bool {
    let addr: Address = newAddress(-1, 0xabcdef);
    try {
        forceWorkchain(addr, 0, 0);
        return false; // No exception thrown means failure
    } catch (exitCode) {
        // Expecting exit code 138 for address not being on the basechain.
        return exitCode == 138;
    }
}

// runAllTests aggregates all tests
fun runAllTests(): Bool {
    return test_parseVarAddress()
        && test_storeBasechainAddress()
        && test_address_string_different()
        && test_builder_overflow()
        && test_address_consistency()
        && test_parseVarAddress_underflow()
        && test_newBasechainAddress_large()
        && test_address_roundtrip()
        && test_forceWorkchain_valid()
        && test_forceWorkchain_invalid();
}
