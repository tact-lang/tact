contract Test {
    // Test 6: Using underscore to discard the receiver parameter for arbitrary text messages.
    receive(_: String) {}
}
