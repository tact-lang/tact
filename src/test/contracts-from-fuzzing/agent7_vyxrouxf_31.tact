contract TestTonZero {
    // Testing ton() with exactly 9 decimals representing 0 nanoToncoin
    value: Int = ton("0.000000000");

    receive() {}
}
