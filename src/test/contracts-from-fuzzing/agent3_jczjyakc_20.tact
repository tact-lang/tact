contract TestTonLarge {
    // Testing compile-time function ton with an extremely large number
    // Input: "100000000000000000000" representing a humungous Toncoin amount
    // The expected behavior is that the function should convert this correctly to nanoToncoins or fail if overflow occurs.
    huge: Int = ton("100000000000000000000");

    receive() {}
}
