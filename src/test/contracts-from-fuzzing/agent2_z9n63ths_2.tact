contract ExpressionTest {
    fun test() {
        // Testing integer literal with underscores and a binary literal with addition
        dump(1000 + 0b101); // Expected output: 1005
    }
    
    // Receiver to trigger the test function
    receive() {
        self.test();
    }
}