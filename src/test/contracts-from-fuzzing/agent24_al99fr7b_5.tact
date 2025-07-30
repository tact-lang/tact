contract TestCTDiv {
    // Testing constant evaluation with arithmetic using compile-time functions
    // 1 Toncoin is 1,000,000,000 nanoToncoin, so 100 / ton("1") should evaluate to 0 (integer division)
    const TON_DIV: Int = 100 / ton("1");

    get fun getDiv(): Int {
        return self.TON_DIV; // expecting 0
    }

    // Dummy receive function to trigger full compilation
    receive() {
        cashback(sender());
    }
}
