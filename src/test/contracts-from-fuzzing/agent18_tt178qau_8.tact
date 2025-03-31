contract TestRawSliceValid {
    // Valid use of rawSlice() without bit-padding
    raw: Slice = rawSlice("4a");

    receive() {}
}
