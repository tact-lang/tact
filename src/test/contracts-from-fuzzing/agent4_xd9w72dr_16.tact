contract TestTonWhitespace {
    // Testing ton with leading whitespace; expected to fail if not trimmed
    value: Int = ton(" 1");
    receive () {}
}
