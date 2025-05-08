contract Test {
    // Test arithmetic operator precedence: multiplication has higher precedence than addition
    fun calc(): Int {
        return 1 + 2 * 3; // Expected: 1 + (2 * 3) = 7
    }
    
    receive() {
        self.calc();
    }
}
