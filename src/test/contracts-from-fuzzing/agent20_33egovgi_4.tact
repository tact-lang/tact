contract ConstSumTest() {
    // Compile-time evaluation: Sum of two ton("1") values.
    // 1 Toncoin = 1000000000 nanoToncoin, so sum should equal 2000000000.
    const SUM: Int = ton("1") + ton("1");
    
    receive() {
        require(self.SUM == 2000000000, "Constant sum evaluation failed");
        cashback(sender());
    }
}
