contract TestHalfTon {
    // Test that ton("0.5") correctly evaluates to half Toncoin, i.e., 500000000 nanoToncoins
    const HALF: Int = ton("0.5");
    const EXPECTED_HALF: Int = 500000000;

    receive() {
        dump(self.HALF);
        dump(self.EXPECTED_HALF);
    }
}
