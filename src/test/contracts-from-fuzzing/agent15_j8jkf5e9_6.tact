contract TestTON() {
    // Compile-time evaluation of ton()
    // Expected: ton("1") should be 1000000000 nanoToncoins
    // and ton("0.5") should be 500000000 nanoToncoins
    const ONE: Int = ton("1");
    const HALF: Int = ton("0.5");

    fun test() {
        dump(self.ONE);
        dump(self.HALF);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
