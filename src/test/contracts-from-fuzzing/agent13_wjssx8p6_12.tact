contract Test {
    // Test ton() with valid human-readable formats
    one: Int = ton("1");            // expected: 10^9 nanoToncoins
    pointOne: Int = ton("0.1");      // expected: 10^8 nanoToncoins
    nano: Int = ton("0.000000001");  // expected: 1 nanoToncoin

    receive () {}
}
