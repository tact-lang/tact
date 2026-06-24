contract TestSelfLiteral() {
    // This test focuses on the 'self' literal and contract-level constant access
    const X: Int = 42;
    fun run() {
        // Access contract-level constant via self
        require(self.X == 42, "Self constant access failed");
    }
    receive() {
        self.run();
    }
}
