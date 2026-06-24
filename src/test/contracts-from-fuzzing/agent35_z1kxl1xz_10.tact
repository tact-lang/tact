contract TestTonValid {
    // Testing valid usage of compile-time function ton()
    one: Int = ton("1");            // Expected: 10^9 nanoToncoins
    pointOne: Int = ton("0.1");      // Expected: 10^8 nanoToncoins
    nano: Int = ton("0.000000001");  // Expected: 1 nanoToncoin
}
