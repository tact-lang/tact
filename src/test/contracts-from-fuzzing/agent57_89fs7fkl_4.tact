contract TestTonHalf {
    // Contract-level constant computed at compile-time using ton() with a float string
    const halfTon: Int = ton("0.5");    // Expected to evaluate to 500000000

    receive() {
        require(self.halfTon == 500000000, "ton('0.5') evaluation incorrect");
    }
}
