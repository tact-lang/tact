contract TonArithmetic() {
    // Using the built-in compile-time function ton to compute nanoToncoin values.
    // ton("1") should yield 1,000,000,000 nanoToncoin. Similarly, ton("0.5") should yield 500,000,000.
    const ONE: Int = ton("1");
    const HALF: Int = ton("0.5");
    // Compute RESULT as the sum of two halves. Note the use of self to reference contract-level constants.
    const RESULT: Int = self.HALF + self.HALF;

    // Getter function to validate constant arithmetic at compile-time
    get fun check() : Int {
        // This should pass if constant evaluation is correct
        require(self.RESULT == self.ONE, "ton arithmetic mismatch: HALF+HALF != ONE");
        return self.RESULT;
    }

    // Simple receiver so that the contract is fully compiled
    receive() {
        // No operation needed
    }
}
