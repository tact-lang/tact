contract Test {
    // Test 2: Specific text receiver for matching text message "hello"
    receive("hello") {
        // matched literal text
    }
}
