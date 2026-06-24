contract TestRawSliceValid {
    // Test rawSlice: valid hex string without bit-padding
    s: Slice = rawSlice("4a");
    receive () {}
}
