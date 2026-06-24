contract SomeContract {}

// Test 21: Construct an invalid address slice with a wrong tag (expected tag for standard address is 0b100 = 4)
fun testInvalidAddressSlice(): Bool {
    // Use tag 0b101 (=5) instead of 0b100
    let s: Slice = beginCell()
        .storeUint(0b101, 3)   // invalid tag
        .storeInt(0, 8)        // chain id = 0
        .storeUint(0, 256)     // account id (256 bits of 0)
        .asSlice();
    try {
        let _ : Address = s.asAddress(0);
        return false; // expected to throw
    } catch (exitCode) {
        return (exitCode == 136);
    }
}

// Test 22: Construct a slice with valid tag but invalid account id length (42 bits instead of 256)
fun testInvalidAccountIdLength(): Bool {
    let s: Slice = beginCell()
        .storeUint(0b100, 3)   // valid tag for standard address
        .storeInt(0, 8)        // chain id = 0
        .storeUint(0, 42)      // invalid account id length
        .asSlice();
    try {
        let _ : Address = s.asAddress(0);
        return false; // expected to throw
    } catch (exitCode) {
        return (exitCode == 136);
    }
}

// Test 23: Validate that asAddressUnsafe on a valid slice returns the same address
fun testAsAddressUnsafe(): Bool {
    let orig: Address = contractAddress(initOf SomeContract());
    let s: Slice = orig.asSlice();
    let unsafeAddr: Address = s.asAddressUnsafe();
    return (unsafeAddr == orig);
}

// Test 24: Validate that asAddressUnsafe does not throw on an invalid slice, but the safe version does
fun testAsAddressUnsafeInvalid(): Bool {
    // Construct an invalid slice with an incorrect tag
    let s: Slice = beginCell().storeUint(7, 3).asSlice();
    // asAddressUnsafe should not throw even though the slice is invalid
    let _ : Address = s.asAddressUnsafe();
    // Now, the safe version should throw
    try {
        let _ : Address = s.asAddress(0);
        return false; // expected to throw
    } catch (exitCode) {
        return (exitCode == 136);
    }
}

// Test 25: Create an address with the maximum 256-bit hash value
fun testNewAddressMax256(): Bool {
    // Maximum 256-bit value: 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    let max256: Int = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    let addr: Address = newAddress(0, max256);
    // Check that toString produces a non-empty string
    return addr.toString() != "";
}

// Test 29: Construct a VarAddress with extra bits in the builder, and verify the remainder
fun testVarAddressRemainder(): Bool {
    // Build a VarAddress like in testParseVarAddressValid, then append extra bits
    let b: Builder = beginCell()
        .storeUint(6, 3)   // tag
        .storeUint(9, 9)   // length for address
        .storeInt(0, 32)   // workchain = 0
        .storeUint(42, 9)  // account id = 42
        .storeUint(5, 3);  // extra bits: binary 101 = 5
    let s: Slice = b.asSlice();
    let varAddr = parseVarAddress(s);
    // Now, s should have 3 remaining bits. Load them and check if they equal 5
    let rem: Int = s.loadUint(3);
    return (rem == 5);
}

// Test 30: Test newBasechainAddress with maximum 256-bit hash value
fun testMaxBasechainAddress(): Bool {
    let max256: Int = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    let addr: BasechainAddress = newBasechainAddress(max256);
    return (addr.hash == max256);
}

// Aggregate all new tests from Test 21 to Test 30
fun runAdditionalTests(): Bool {
    return testInvalidAddressSlice()
        && testInvalidAccountIdLength()
        && testAsAddressUnsafe()
        && testAsAddressUnsafeInvalid()
        && testNewAddressMax256()
        && testVarAddressRemainder()
        && testMaxBasechainAddress();
}

// Final entry point for all tests in this round
fun finalTestRun3(): Bool {
    return runAdditionalTests();
}
