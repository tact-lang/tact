contract TestTonLeadingDot {
    // Testing ton() with a leading dot in the number
    value: Int = ton(".1");

    receive() {}
}
