contract TestTonNegative {
    // Testing ton with a negative value which is documented to be accepted at compile-time (known issue)
    a: Int = ton("-0.5");
    receive() {}
}
