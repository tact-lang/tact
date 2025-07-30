contract Test {
    // Testing multiple text receivers: specific and arbitrary
    receive("hello") {}
    receive(str: String) {}
}
