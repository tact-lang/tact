contract Test {
    // Test: Overlapping text receivers, one with specific text, one for arbitrary text
    receive("increment") {
        // Handler for specific text "increment"
    }

    receive(str: String) {
        // Handler for arbitrary text messages
    }
}
