contract Test {
    // Fuzz Test G.5: Use ton() with a trailing decimal point
    // This is to test if the ton function accepts input like "1." or rejects it.
    one: Int = ton("1.");
    
    receive() {}
}
