contract TestRawPadding {
    // Testing rawSlice with bit-padding indicator '_' as documented
    // Documentation states: if there is an underscore at the end, it applies bit-padding rules
    s: Slice = rawSlice("4a_");

    receive() {}
}
