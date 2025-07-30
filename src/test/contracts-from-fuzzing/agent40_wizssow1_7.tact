contract TestTonHalf() {
    // Testing compile-time evaluation of ton() with a fractional string
    // Expected: ton("0.5") returns 500000000 (0.5 * 1e9)
    const halfTon: Int = ton("0.5");

    get fun getHalfTon(): Int {
        return self.halfTon;
    }

    // Dummy receive function to ensure full compilation
    receive() {
        cashback(sender());
    }
}
