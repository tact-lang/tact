contract TestTonEdge {
    // Testing ton() with trailing zeros in the input
    // Expected: 1 Toncoin as 10^9 nanoToncoins
    one: Int = ton("1.000000000");
    
    receive() {}
}
