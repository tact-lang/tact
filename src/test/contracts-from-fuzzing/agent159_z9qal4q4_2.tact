contract Test {
    // Test 2: Literal Text Receiver. This should only match messages containing exactly "hello".
    receive("hello") {
        // Literal receiver body
    }
}
