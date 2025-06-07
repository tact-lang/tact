contract TestRawSliceOdd {
    // Using odd-length hex string; expected: error or specific behavior
    a: Slice = rawSlice("F");
    
    receive () {}
}
