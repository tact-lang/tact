contract TestTonHalf {
    // Constant evaluation of built-in compile-time function ton() with fractional value
    // 0.5 Toncoin should be equivalent to 500,000,000 nanoToncoin
    const TON_HALF: Int = ton("0.5");

    receive() {
        require(self.TON_HALF == 500000000, "ton half conversion failed");
        dump(self.TON_HALF);
    }
}
