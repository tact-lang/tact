contract TestRawSliceLimit {
    // 256 hex digits represent 256*4 = 1024 bits, which exceeds the 1023 bits limit
    stored: Slice = rawSlice("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");

    receive() {}
}
