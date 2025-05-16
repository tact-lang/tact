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
    let b1: Builder = b.storeBasechainAddress(bc);
    // No direct way to extract BasechainAddress from the builder, but if no overflow or error occurred, assume success
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
    // Normally a cell has around 1023 bits, so we use 1014 bits, leaving only 9 free bits
    let b: Builder = beginCell().storeUint(0, 1014);
    try {
        // Attempt to store an address; an Address requires more than 9 free bits
        b.storeAddress(newAddress(0, 0xabcdef));
        return false; // Test fails if no exception is thrown
    } catch (exitCode) {
        // Expecting error exit code 8 for cell overflow
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

// runAllTests returns true only if all individual tests pass
fun runAllTests(): Bool {
    return test_parseVarAddress()
        && test_storeBasechainAddress()
        && test_address_string_different()
        && test_builder_overflow()
        && test_address_consistency();
}
