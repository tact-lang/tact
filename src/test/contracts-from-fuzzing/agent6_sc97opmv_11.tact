contract TestTonNegative {
    // Testing ton with negative value which should be invalid as human-readable Ton amounts cannot be negative
    ret: Int = ton("-1");

    receive () {}
}
