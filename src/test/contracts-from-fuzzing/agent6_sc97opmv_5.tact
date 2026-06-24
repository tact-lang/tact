contract TestRawSliceValid {
    // Valid rawSlice: non-bit-padded case
    s: Slice = rawSlice("4a");

    receive () {}
}
