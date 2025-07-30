contract TestRawSliceConst() {
    // This contract tests compile-time evaluation of the rawSlice() function.
    // The rawSlice function is expected to produce a Slice from a given hex-encoded string.
    // We use the string "000DEADBEEF000" as input, and expect a Slice value that can be inspected.
    const my_slice: Slice = rawSlice("000DEADBEEF000");

    get fun value() : Slice {
        return self.my_slice;
    }
}
