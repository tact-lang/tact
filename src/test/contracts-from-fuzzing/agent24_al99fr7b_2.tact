contract TestContract {
    // Compile-time evaluation of ton("1") should yield 1000000000
    const TON_ONE: Int = ton("1");

    get fun getTon(): Int {
        return self.TON_ONE; // expecting 1000000000
    }

    // Dummy receive to ensure function is compiled
    receive() {
        cashback(sender());
    }
}
