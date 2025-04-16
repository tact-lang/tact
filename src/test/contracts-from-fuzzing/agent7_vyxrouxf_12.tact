contract TestTonWhitespace {
    // Testing ton() with extra whitespace in the input
    value: Int = ton(" 1 ");

    receive() {}
}
