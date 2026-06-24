contract TestTon {
    // Test constant evaluation of built-in compile-time function ton()
    // Expected: ton("1") should evaluate to 1000000000 (1 Toncoin = 10^9 nanoToncoins)
    const TON_ONE: Int = ton("1");

    fun getTon(): Int {
         return self.TON_ONE;
    }

    receive() {
         dump(self.getTon());
    }
}
