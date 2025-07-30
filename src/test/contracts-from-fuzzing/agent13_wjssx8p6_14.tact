contract Test {
    // Test rawSlice() exceeding allowed bit length: 256 hex digits (1024 bits) which is above the 1023 limit
    // Construct a hex string with 256 'f' characters
    s: Slice = rawSlice("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");

    receive () {}
}
