contract Test {
    // Test ton() with negative input string; expectation is to fail conversion
    // Negative value should be invalid as Toncoin is non-negative
    x: Int = ton("-1");
    
    receive() {}
}
