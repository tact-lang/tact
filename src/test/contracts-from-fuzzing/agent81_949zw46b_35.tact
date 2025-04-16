contract Test {
    // Test 35: Having both an internal specific text receiver and an external receiver for the same text literal "hello"
    // This test verifies if external receivers and internal receivers can coexist for the same text message
    receive("hello") {
        // Internal receiver for text literal "hello"
    }

    external("hello") {
        // External receiver for text literal "hello"
    }

    receive() {
        // Fallback empty message receiver
    }
}
