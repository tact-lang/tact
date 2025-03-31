contract TestTonTrailingDot {
    // Testing ton() with a trailing dot in the number
    // Expecting this to error if the format is invalid
    value: Int = ton("1.");

    receive() {}
}
