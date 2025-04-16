contract Test {
    // Specific text comment receiver
    // This receiver should match messages with the exact text "greeting"
    receive("greeting") {
        // Action for greeting message
    }
}
