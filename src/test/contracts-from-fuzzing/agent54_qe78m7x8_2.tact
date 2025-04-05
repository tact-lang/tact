contract Test {
    // Test compile-time evaluation of ton() built-in function
    // 1 Toncoin should be equal to 1000000000 nanoToncoins
    const ONE_TON: Int = ton("1");
    
    receive() {
        // Access the constant via self since it's a contract-level constant
        require(self.ONE_TON == 1000000000, "ton() constant evaluation failed");
        cashback(sender());
    }
}
