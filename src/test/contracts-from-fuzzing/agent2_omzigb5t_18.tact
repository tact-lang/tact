contract TestRawSliceEmpty {
    // Testing rawSlice with an empty hex string; expecting a slice of zero bits if allowed, or a compile-time error if not.
    s: Slice = rawSlice("");
    receive() {}
}
