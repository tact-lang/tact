contract Test {
    // Testing ton() with a negative number. The documentation doesn't specify negative values; expect error.
    negative: Int = ton("-1");
    receive() {}
}
