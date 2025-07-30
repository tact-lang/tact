contract TestRawSliceOdd {
    // Testing rawSlice() with an odd number of hex digits
    // Expected: error, since valid hex string should have even number of characters unless it's bit-padded
    stored: Slice = rawSlice("4");

    receive() {}
}
