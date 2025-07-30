contract TestTonHalf() {
    receive() {
        // Verify that ton("0.5") is evaluated at compile time correctly
        // Expected: 0.5 Toncoin = 500000000 nanoToncoin
        require(ton("0.5") == 500000000, "ton(\"0.5\") evaluation failed");

        // Minimal valid operation
        cashback(sender());
    }
}
