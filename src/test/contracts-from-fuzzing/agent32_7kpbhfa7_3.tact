contract Test {
    // Test 3: Arbitrary text message receiver using a parameter named 'str'
    // This receiver should catch any text message that is not exactly "hello"
    receive(str: String) {
        // Code body is empty
    }
}
