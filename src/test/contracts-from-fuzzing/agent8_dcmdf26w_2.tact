contract Test {
    // Test 1a: Valid usage of wildcard '_' as a discard parameter in receive with Slice type
    // Expected: Compiles successfully
    receive(_: Slice) {
    }
}
