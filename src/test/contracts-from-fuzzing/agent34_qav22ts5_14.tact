contract Test {
    // Test: using wildcard in constructor parameter
    init (_: Int) {
        // Allowed: discard constructor parameter
    }
    
    receive() {}
}
