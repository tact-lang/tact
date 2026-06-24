contract Test6 {
    // Test 6: Receiver with underscore parameter to discard the received string
    receive(_: String) {
        // Body intentionally empty to test underscore parameter handling
    }
}
