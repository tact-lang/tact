contract TestTonNegative {
    // Test ton with a negative value
    // According to docs, ton expects a human-readable format containing a Toncoin value.
    // Behavior is undefined for negatives, so this tests if negative values are accepted.
    value: Int = ton("-1");

    receive() {}
}
