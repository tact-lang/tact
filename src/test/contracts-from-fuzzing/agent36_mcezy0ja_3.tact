contract TestRawSliceOdd {
    // Attempting an odd-length hex string should trigger an error
    a: Slice = rawSlice("abc");
    receive() {}
}
