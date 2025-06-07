contract Test {
    // Test 2: Valid text-specific message receiver
    receive("hello") {}

    // This receiver should only handle incoming messages with comment "hello"
}