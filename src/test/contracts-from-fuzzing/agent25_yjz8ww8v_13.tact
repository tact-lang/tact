contract SomeContract {}

// Test 31: Test equality symmetry: two addresses created with identical parameters using newAddress should be equal both ways.
fun testEqualitySymmetry(): Bool {
    let addr1: Address = newAddress(0, 0xCAFEBABE);
    let addr2: Address = newAddress(0, 0xCAFEBABE);
    return (addr1 == addr2) && (addr2 == addr1);
}

// Test 32: Test transitivity of equality using roundtrip conversion with asSlice and asAddressUnsafe.
fun testEqualityTransitivity(): Bool {
    let a: Address = contractAddress(initOf SomeContract());
    let s: Slice = a.asSlice();
    let b: Address = s.asAddressUnsafe();
    // Also, convert b back into a cell and re-read using asSlice
    let s2: Slice = beginCell().storeAddress(b).asSlice();
    let c: Address = s2.asAddress(0);
    return (a == b) && (b == c) && (a == c);
}

// Test 33: Test that two addresses with different account ids are not equal.
fun testDifferentAddressesNotEqual(): Bool {
    let addr1: Address = newAddress(0, 0x123456);
    let addr2: Address = newAddress(0, 0x123457);
    return (addr1 != addr2);
}

// Test 34: Test that forceWorkchain throws when the provided workchain does not match the address's chain (similar to earlier, but new value).
fun testForceWorkchainMismatch(): Bool {
    let addr: Address = newAddress(-1, 0xBEEF);
    try {
        forceWorkchain(addr, 0, 700);
        return false; // should throw
    } catch (exitCode) {
        return (exitCode == 700);
    }
}

// Test 35: Test that repeating asSlice() conversion multiple times yields the same slice.
fun testMultipleAsSliceInvocations(a: Address): Bool {
    let s1: Slice = a.asSlice();
    let s2: Slice = a.asSlice();
    return (s1 == s2);
}

// Aggregate new tests: Test 31 to Test 35
fun runAdditionalEqualityTests(a: Address): Bool {
    return testEqualitySymmetry()
        && testEqualityTransitivity()
        && testDifferentAddressesNotEqual()
        && testForceWorkchainMismatch()
        && testMultipleAsSliceInvocations(a);
}

// Final entry point for the new round of tests
fun finalTestRun4(): Bool {
    // Use a sample address from contract initialization
    let a: Address = contractAddress(initOf SomeContract());
    return runAdditionalEqualityTests(a);
}
