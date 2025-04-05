contract TestTon() {
    // Constant computed at compile-time using ton built-in function
    // Expected value: 1000000000 (1 Toncoin = 1e9 nanoToncoin)
    const TON: Int = ton("1");

    // Receiver to ensure the contract is fully compiled and constant is accessible via self
    receive() {
        dump(self.TON);
    }
}
