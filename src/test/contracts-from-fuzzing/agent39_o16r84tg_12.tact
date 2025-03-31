contract TestRawSliceBitPadded {
    // Testing rawSlice() with a valid bit-padded hexadecimal string
    s: Slice = rawSlice("4a_");

    // Dummy receive function
    receive () {}
}
