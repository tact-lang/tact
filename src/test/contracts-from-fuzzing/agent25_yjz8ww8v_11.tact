contract SomeContract {}

// Test 21: Construct an invalid address slice with wrong tag (expected tag for standard address is 0b100 = 4)
fun testInvalidAddressSlice(): Bool {
    // Here we use tag 0b101 (5) instead, which should be rejected
    let s: Slice = beginCell()
        .storeUint(0b101, 3)   // invalid tag (should be 0b100)
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
    // asAddressUnsafe should not throw
    let _ : Address = s.asAddressUnsafe();
    // Now, the safe version should throw
    try {
        let _ : Address = s.asAddress(0);
        return false; // expected to throw
    } catch (exitCode) {
        return (exitCode == 136);
    }
}

// Aggregate all new slice-related address tests
fun runAddressSliceTests(): Bool {
    return testInvalidAddressSlice()
        && testInvalidAccountIdLength()
        && testAsAddressUnsafe()
        && testAsAddressUnsafeInvalid();
}

// Entry point for the new tests
fun finalTestRun2(): Bool {
    return runAddressSliceTests();
}
