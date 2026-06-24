contract TestTonHalf {
    // Testing built-in compile-time function: ton with fractional value
    const TON_HALF: Int = ton("0.5");  // Expected: 500000000 (i.e., 0.5 * 10^9)

    receive() {
        require(self.TON_HALF == 500000000, "ton(0.5) evaluation mismatch");
        cashback(sender());
    }
}
