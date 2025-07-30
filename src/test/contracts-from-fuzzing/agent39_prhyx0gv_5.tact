contract Test {
    // Test overlapping text receivers and underscore usage
    // Specific text comment receiver for "hello"
    receive("hello") {
        // This block should be called when message is exactly "hello"
    }

    // Generic text message receiver using underscore for unused parameter
    receive(_ : String) {
        // This block should be called for any text message not matching "hello"
    }

    // Additional empty receiver to ensure non-conflict with text receivers
    receive() {
        // Called for empty messages
    }
}
