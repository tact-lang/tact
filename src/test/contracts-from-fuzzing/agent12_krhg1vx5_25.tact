contract Test {
    // Fuzz Test R5: Use rawSlice() with a hex string representing 1024 bits (256 hex digits), which should exceed the 1023-bit limit
    // We create a string with 256 'F' characters
    s: Slice = rawSlice("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");

    receive() {}
}
