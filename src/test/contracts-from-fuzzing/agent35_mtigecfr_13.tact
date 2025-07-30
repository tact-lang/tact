contract Test {
    // Testing usage of underscore to discard receiver parameter for text messages
    receive(_: String) {}
}
