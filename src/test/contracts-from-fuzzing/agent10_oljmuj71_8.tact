contract Test {
    // Testing ton() with a trailing dot "1." which is borderline
    value: Int = ton("1.");
    receive() {}
}
