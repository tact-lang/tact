contract Test {
    // Test underscore discard parameter in arbitrary text receiver
    receive (_: String) {
        // This receiver uses underscore discard for the text message
    }
}
