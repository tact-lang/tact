contract Test {
    // Test compile-time 'rawSlice' with an odd-length hex string
    // Expectation: Should trigger a compile-time error because hex encoding requires even number of digits
    stored: Slice = rawSlice("4");

    receive () {}
}
