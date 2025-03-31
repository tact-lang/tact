contract Test {
    // Test compile-time 'rawSlice' with an odd-length hex string followed by an underscore for bit-padding
    // Expectation: Should trigger a compile-time error because the hex part must have an even number of digits
    stored: Slice = rawSlice("4_");

    receive () {}
}
