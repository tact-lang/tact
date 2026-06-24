contract TestTon {
    // 1 Toncoin = 1e9 nanoToncoin, so 0.1 Toncoin should be 1e8 nanoToncoin
    const TON_0_1: Int = ton("0.1");
    receive() {
        require(self.TON_0_1 == 100000000, "ton(\"0.1\") constant evaluation failed");
    }
}
