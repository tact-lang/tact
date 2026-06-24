contract Test {
    // Specific text message receiver with comment "msg"
    receive("msg") {
        // Handling exact "msg" text
    }

    // Generic text message receiver for arbitrary text
    receive(str: String) {
        // Handling any text messages
    }
}
