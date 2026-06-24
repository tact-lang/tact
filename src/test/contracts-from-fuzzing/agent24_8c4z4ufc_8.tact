contract TestTonInvalidDecimal {
    // Testing ton() with an invalid decimal format: trailing decimal point
    // Expected to fail at compile-time due to incorrect number format
    value: Int = ton("1.");

    receive() {}
}
