contract TestRawSliceValid {
    // Using rawSlice with hex "4a" (non bit-padded)
    // Expected loadUint(8) -> 74
    stored: Slice = rawSlice("4a");

    receive () {}
}
