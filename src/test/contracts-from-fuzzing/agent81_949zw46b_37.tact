contract Test {
    // Test 37: External receiver using underscore parameter (should check if allowed)
    external(_: String) {
        // External receiver with discarded parameter
    }

    receive() {
        // Fallback empty receiver
    }
}
