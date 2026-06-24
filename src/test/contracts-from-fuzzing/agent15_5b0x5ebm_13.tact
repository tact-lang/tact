contract TestTon {
    receive() {
        // Test the ton() compile-time conversion of a string literal to nanoToncoin
        // Expected output: 1000000000 (i.e., 1 Toncoin in nanoToncoins)
        dump(ton("1"));
    }
}
