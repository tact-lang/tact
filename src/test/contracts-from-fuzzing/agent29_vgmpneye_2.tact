contract TestTon() {
    // Define a constant evaluated at compile-time using the built-in ton() function
    // According to documentation, ton("1") should be 1 Toncoin = 1_000_000_000 nanoToncoins
    const VALUE: Int = ton("1");

    // This receiver ensures the constant is correctly computed by asserting it equals 1000000000
    receive() {
        // Access the contract-level constant using self.
        require(self.VALUE == 1000000000, "ton constant evaluation failed");
    }
}
