contract TestRawSliceBitPadded {
    // Using rawSlice with hex bit-padded: "4a_"
    // Expected: rawSlice("4a_").loadUint(6) should yield 18
    stored: Slice = rawSlice("4a_");
    
    receive () {}
}
