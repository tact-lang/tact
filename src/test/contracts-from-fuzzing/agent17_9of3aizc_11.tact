contract TonTest() {
    // Testing ton() with edge cases
    // Expect 0.000000001 Toncoin to produce 1 nanoToncoin
    const nano: Int = ton("0.000000001");
    // Expect 1 Toncoin to produce 1000000000 nanoToncoins
    const one: Int = ton("1");

    receive() {
        require(self.nano == 1, "Expected nano 1");
        require(self.one == 1000000000, "Expected one equals 1000000000");
        cashback(sender());
    }
}
