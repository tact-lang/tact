contract TestTonValid {
    // Testing ton() with valid inputs
    one: Int = ton("1");             // Expected: 1e9 nanoToncoins
    pointOne: Int = ton("0.1");        // Expected: 1e8 nanoToncoins
    nano: Int = ton("0.000000001");    // Expected: 1 nanoToncoin

    // Dummy receive function
    receive () {}
}
