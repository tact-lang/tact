contract TestNoFallback {
    // Test: Contract with no fallback receiver declared
    // Only handles empty messages and specific text messages

    receive() {
        // Handles empty messages
    }

    receive("ping") {
        // Handles specific text message "ping"
    }
}
