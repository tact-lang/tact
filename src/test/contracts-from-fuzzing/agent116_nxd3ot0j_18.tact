contract Test18 {
    // Test 18: Using underscore to discard parameter in an arbitrary text message receiver
    receive (_: String) {
        // This receiver ignores the text payload
    }
}
