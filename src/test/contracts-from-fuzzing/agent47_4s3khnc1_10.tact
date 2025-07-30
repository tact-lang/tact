contract TestHalfTon() {
    // Test compile-time evaluation of ton with fractional value
    // According to documentation: ton("1") produces 1000000000, so ton("0.5") should produce 500000000
    const HALF: Int = ton("0.5");

    receive() {
        dump(self.HALF); // expected output: 500000000
        cashback(sender());
    }
}
