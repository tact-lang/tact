contract TestRawSliceBitPadded {
    bitPadded: Slice = rawSlice("000DEADBEEF000_");

    receive () {}
}
