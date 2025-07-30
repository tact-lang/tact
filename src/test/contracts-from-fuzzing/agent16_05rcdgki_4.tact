contract Test {
    // Test 11: Testing rawSlice() with an odd hex digit and underscore for bit-padding
    // Here, the hex string 'A_' has an odd number of hex digits, which is ambiguous.
    // Expected behavior: Depending on implementation, either be converted or an error should be thrown.
    stored: Slice = rawSlice("A_");
    receive() {}
}
