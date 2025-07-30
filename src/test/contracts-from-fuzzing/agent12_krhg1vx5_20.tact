contract Test {
    // Fuzz Test G.7: Use ton() with a leading space before a negative value
    // Expectation: Checking whether whitespace is trimmed or causes error. 
    // Currently: Likely to fail converting to BigInt.
    val: Int = ton(" -1");
    
    receive() {}
}
