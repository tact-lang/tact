contract TestTonFraction() {
    // Testing compile-time evaluation of ton() with fractional input
    // Expected: 500000000 nanoToncoins (for "0.5")
    const HALF_TON: Int = ton("0.5");

    fun run() {
        dump(self.HALF_TON.toString());
    }

    receive() {
        self.run();
    }
}
