contract TestTonNegative {
    // Testing a negative value input to ton() function
    value: Int = ton("-1");

    receive() {}
}
