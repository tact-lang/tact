contract Test {
    // Fuzz Test G.9: Use ton() with a negative fractional value to see how it behaves.
    a: Int = ton("-0.1");
    
    receive() {}
}
