contract Test {
    // Test 2: Receiver for specific text comment. It should only trigger if the incoming message exactly matches "hello"
    receive("hello") {}
}
