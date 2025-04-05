contract Test {
    // Define contract-level constants using compile-time functions
    const TON_ONE: Int = ton("1");           // Expected: 1000000000 (10^9)
    const ASCII_LIGHTNING: Int = ascii("⚡");  // Expected: 14850721

    receive() {
        // Access constants via self
        require(self.TON_ONE == 1000000000, "ton function evaluation mismatch");
        require(self.ASCII_LIGHTNING == 14850721, "ascii function evaluation mismatch");
        cashback(sender());
    }
}
