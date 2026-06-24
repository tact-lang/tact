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

fun run_all(): Int {
    let sum = test_invalid_address_conversion();
    sum = sum + test_address_comparisons();
    sum = sum + test_masterchain_newAddress();
    sum = sum + test_literal_toString();
    return sum;
}
