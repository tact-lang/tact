contract Test {
    // Specific text message receiver triggers only for message "hello"
    receive("hello") {
        // specific handling for 'hello'
    }

    // Fallback text receiver for all other text messages
    receive(str: String) {
        // handling for other arbitrary text messages
    }
}
