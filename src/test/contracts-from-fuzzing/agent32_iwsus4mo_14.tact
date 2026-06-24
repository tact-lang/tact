contract TestTonTrailingDot {
    // Testing compile-time function 'ton' with trailing decimal point input
    // Expected: It should be interpreted as 1.0 Toncoin, i.e. 10^9 nanoToncoins
    one: Int = ton("1.");

    receive () {}
}
