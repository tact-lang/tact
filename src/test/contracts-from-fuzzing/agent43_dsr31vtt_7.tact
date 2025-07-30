contract TestRawSliceEmpty {
    // Testing rawSlice with an empty hex string
    stored: Slice = rawSlice("");

    receive () {}
}
