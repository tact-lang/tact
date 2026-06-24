contract TestRawSlice {
    // Testing rawSlice() without method calls; checking that it accepts valid hex string
    s: Slice = rawSlice("4a");

    // Dummy receive function
    receive () {}
}
