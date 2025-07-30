contract Test {
    // Test receiver conflict: specific text vs. arbitrary text
    receive("test") {}
    receive(str: String) {}
}
