contract Test {
    // Test 5B: Using underscore as parameter name (ignoring parameter) in a binary message receiver
    receive(_: Slice) {}

    // This test verifies if the receiver can discard the Slice parameter using underscore as parameter name.
}
