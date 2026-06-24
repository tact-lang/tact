contract Test {
    // Specific text receiver for "hello"
    receive("hello") {
        // handling for "hello" message
    }

    // General text receiver
    receive(str: String) {
        // handling for any text message
    }
}
