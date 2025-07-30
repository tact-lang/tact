contract Test {
    // Testing ton() with a value starting with a decimal point. Expected: Should reject input because of missing integer part.
    // If accepted, this might be a bug.
    value: Int = ton(".1");
    receive() {}
}
