contract Test {
    // Fuzz Test R1: rawSlice with odd-length hex string (should be invalid because hex must have even number of digits)
    s: Slice = rawSlice("F");
    
    receive() {}
}
