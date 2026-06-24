/// Test case: Valid usage of compile-time function rawSlice (non-bit padded and bit-padded)
contract TestRawSliceValid {
    // Not bit-padded: should load full 8 bits of 0x4a = 74
    s1: Slice = rawSlice("4a");

    // Bit-padded: underscore indicates bit-padding, should load 6 bits of 0x4a -> 18
    s2: Slice = rawSlice("4a_");

    receive () {}
}
