contract TestTonTrailingSpace {
    // Testing ton with trailing whitespace in the string. According to docs, the formatting should be strict, so this might trigger an error.
    a: Int = ton("1 ");
    receive() {}
}
