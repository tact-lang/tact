contract TestTon() {
    receive() {
        // Check that ton("1") is evaluated at compile time correctly
        // Expected: 1 Toncoin = 1_000_000_000 nanoToncoin
        require(ton("1") == 1000000000, "ton constant evaluation failed");

        // For good measure, perform a cashback to have a minimal valid receiver
        cashback(sender());
    }
}
