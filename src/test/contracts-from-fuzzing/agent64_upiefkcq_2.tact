contract TestSpecificText {
    // Receiver for specific text message "hello"
    receive("hello") {
        // do nothing
    }
}

// Minimal contract for testing receiver of specific text messages