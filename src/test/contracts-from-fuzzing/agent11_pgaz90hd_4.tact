contract TestTonHalf() {
    // Constant computed at compile-time using ton built-in function with a decimal value
    // Expected value: 500000000 (because 1 Toncoin = 1000000000 nanoToncoin)
    const HALF: Int = ton("0.5");

    receive() {
        dump(self.HALF);
    }
}
