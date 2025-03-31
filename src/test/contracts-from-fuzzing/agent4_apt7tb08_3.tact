contract Test {
    // Test arithmetic operator precedence: multiplication should bind stronger than addition
    fun opTest(a: Int, b: Int): Int {
        // Expected evaluation: a + (b * 2)
        return a + b * 2;
    }
    
    receive() {
        self.opTest(3, 4);
    }
}
