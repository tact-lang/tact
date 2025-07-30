contract Test {
    // Testing rawSlice without further method calls, as loadUint cannot be used in compile-time expression
    s1: Slice = rawSlice("4a");
    s2: Slice = rawSlice("4a_");

    receive () {}
}
