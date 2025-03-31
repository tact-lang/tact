contract TestRawSliceValid {
    // Valid even-length hex string
    a: Slice = rawSlice("abcdef");
    receive() {}
}
