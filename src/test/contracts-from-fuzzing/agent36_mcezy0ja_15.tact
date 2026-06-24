contract TestTonLeadingZero {
    // Testing ton with a leading zero; should be interpreted correctly.
    a: Int = ton("01");
    receive() {}
}
