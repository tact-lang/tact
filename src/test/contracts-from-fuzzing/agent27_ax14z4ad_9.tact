contract TestTonNegative {
    // Testing ton compile-time function with a negative value
    value: Int = ton("-1");

    // Dummy receive function
    receive () {}
}
