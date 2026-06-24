contract Test {
    // Test ton() with the borderline value of 0 Toncoin represented as "0.000000000".
    // Expected to compile and yield 0 nanoToncoins.
    nano: Int = ton("0.000000000");

    receive () {}
}
