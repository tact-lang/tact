contract TestTonConversion {
    // Test compile-time conversion of human-readable Ton amounts to nanoToncoins
    one: Int = ton("1");            // Should be 10^9 nanoToncoins
    pointOne: Int = ton("0.1");      // Should be 10^8 nanoToncoins
    nano: Int = ton("0.000000001");  // Should be 1 nanoToncoin

    receive() {}
}
