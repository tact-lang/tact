contract Test {
    // Testing ton() with boundary and valid inputs
    a: Int = ton("0");                // Expected to yield 0 nanoToncoins
    b: Int = ton("0.000000001");        // Expected to yield 1 nanoToncoin
    c: Int = ton("1");                // Expected to yield 1000000000 nanoToncoins

    receive() {}
}
