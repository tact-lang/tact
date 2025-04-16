contract Test {
    receive() {
        // Test K: Using ton() function on a numeric string literal
        let one: Int = ton("1");
        dump(one); // Expected output: 1000000000 (1 Toncoin in nanoToncoins)
    }
}
