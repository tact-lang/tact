contract SomeContract {
    receive() {}
}

// Test: converting an invalid cell slice to Address should trigger an error with exit code 136
fun test_invalid_address_conversion(): Int {
    let s: Slice = beginCell().storeUint(0, 3).endCell().beginParse();
    try {
        let a: Address = s.asAddressUnsafe();
        // If no error thrown, return error code 1
        return 1;
    } catch (exitCode) {
        // According to docs, invalid standard address should trigger exit code 136
        if (exitCode != 136) { return 10; }
        return 0;
    }
}

// Test: Verify address equality and inequality
fun test_address_comparisons(): Int {
    let a: Address = newAddress(0, 42);
    let b: Address = newAddress(0, 42);
    let c: Address = newAddress(0, 43);
    if (!(a == b)) { return 1; }
    if (a == c) { return 2; }
    return 0;
}

// Test: Creating a masterchain address using newAddress with chain id -1
fun test_masterchain_newAddress(): Int {
    let a: Address = newAddress(-1, 42);
    // No additional runtime check needed, just ensure it compiles
    return 0;
}

// Test: Conversion of literal address to string should yield non-empty result
fun test_literal_toString(): Int {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let s: String = a.toString();
    if (s == "") { return 1; }
    return 0;
}

// Test: Store an address in a cell and convert it back via asAddressUnsafe
fun test_round_trip_cell(): Int {
    let orig: Address = newAddress(0, 123456);
    let cell: Cell = beginCell().storeAddress(orig).endCell();
    let s: Slice = cell.beginParse();
    let addr2: Address = s.asAddressUnsafe();
    if (orig.toString() != addr2.toString()) { return 1; }
    return 0;
}

// Test: Verify properties of BasechainAddress creation
fun test_basechain_equality(): Int {
    let a: BasechainAddress = emptyBasechainAddress();
    let b: BasechainAddress = newBasechainAddress(0);
    if (!(a.hash == null)) { return 1; } // empty should have null hash
    if (b.hash == null) { return 2; } // newBasechainAddress should provide a non-null hash
    return 0;
}

// Test: Validate consistency between contractAddress and contractAddressExt
fun test_contractAddress_consistency(): Int {
    let s: StateInit = initOf SomeContract();
    let a1: Address = contractAddress(s);
    let a2: Address = contractAddressExt(0, s.code, s.data);
    if (a1.toString() != a2.toString()) { return 1; }
    return 0;
}

fun run_all(): Int {
    let r1 = test_invalid_address_conversion();
    let r2 = test_address_comparisons();
    let r3 = test_masterchain_newAddress();
    let r4 = test_literal_toString();
    let r5 = test_round_trip_cell();
    let r6 = test_basechain_equality();
    let r7 = test_contractAddress_consistency();
    return r1 + r2 + r3 + r4 + r5 + r6 + r7;
}
