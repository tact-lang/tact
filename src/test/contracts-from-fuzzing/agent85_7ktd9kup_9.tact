contract Test {
    // Overlapping specific and generic text receivers; specific should take precedence at runtime
    receive("hello") {}
    receive(str: String) {}
}