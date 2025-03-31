contract Dummy {}

// Test 1: Verify that parseVarAddress correctly parses a variable-length address from a constructed cell
fun test_parseVarAddress(): Bool {
    // According to documentation:
    // storeUint(6, 3) to mark the following as a VarAddress,
    // then storeUint(123, 9) specifying that the address occupies 123 bits,
    // then storeUint(234, 32) for the workchain ID,
    // followed by storeUint(345, 123) for the address value.
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
    // Since we do not have a direct function to extract BasechainAddress from a cell,
    // we simply ensure that the builder accepted the address without throwing.
    return true;
}

// Test 3: Check that different chain IDs generate different string representations
fun test_address_string_different(): Bool {
    let addrBase: Address = newAddress(0, 0xabcdef);
    let addrMaster: Address = newAddress(-1, 0xabcdef);
    return addrBase.toString() != addrMaster.toString();
}

// Test 4: Force builder overflow error when trying to store an address
// We consume almost all free bits in a cell and then try to store an address which should fail.
fun test_builder_overflow(): Bool {
    // A new cell begins with a capacity of 1023 bits normally, so consume 1014 bits leaving 9 bits free
    let b: Builder = beginCell().storeUint(0, 1014);
    try {
        // Attempt to store an address; an address requires more than 9 free bits.
        b.storeAddress(newAddress(0, 0xabcdef));
        return false; // If no exception, test fails
    } catch (exitCode) {
        // Expecting exit code 8: Cell overflow
        return exitCode == 8;
    }
}

// Test 5: Combine multiple address creation methods for consistency
fun test_address_consistency(): Bool {
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    // They should be equal as per documentation
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
