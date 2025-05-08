contract TestRawSliceOdd {
    // Here, the hex string "F" is of odd length (4 bits). It should be valid if the implementation treats each hex digit as 4 bits.
    stored: Slice = rawSlice("F");
    receive () {}
}
