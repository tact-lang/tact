contract TestTonHalf {
    // Test constant evaluation of ton("0.5")
    // Expected: 0.5 Toncoin = 500000000 nanoToncoins
    const TON_HALF: Int = ton("0.5");

    fun getHalf(): Int {
         return self.TON_HALF;
    }

    receive() {
         dump(self.getHalf());
    }
}
