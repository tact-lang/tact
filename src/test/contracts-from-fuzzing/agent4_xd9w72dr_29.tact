contract TestTonNegative {
    // Testing ton with a negative value. Expected to fail because negative values are not allowed.
    value: Int = ton("-1");
    receive () {}
}
