contract TestTonTrailingDot {
    // Test ton with a trailing dot, which might be ambiguous. According to documentation, a valid ton value should be a valid decimal number in string form.
    // Expecting a compile-time error if it's not accepted.
    value: Int = ton("1.");
    receive () {}
}
