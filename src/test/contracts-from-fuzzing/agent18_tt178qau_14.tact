contract TestTonTrailingDot {
    // Test: Using ton() with a trailing decimal dot
    // Expected: compile error because "1." is not a valid Toncoin string
    v: Int = ton("1.");

    receive() {}
}
