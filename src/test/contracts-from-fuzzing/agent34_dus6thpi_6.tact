contract TestTonValid {
    // Testing ton() with valid inputs
    one: Int = ton("1");            // Expected: 1 Toncoin in nanoToncoins
    pointOne: Int = ton("0.1");       // Expected: 0.1 Toncoin in nanoToncoins
    nano: Int = ton("0.000000001");   // Expected: 1 nanoToncoin
    
    receive() {}
}
