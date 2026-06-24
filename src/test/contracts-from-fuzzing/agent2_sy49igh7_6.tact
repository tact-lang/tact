contract Test {
    // Testing rawSlice with hex "4a" without loadUint call
    s: Slice = rawSlice("4a");
    
    receive() {}
}
