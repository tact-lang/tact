contract Test {
    // Test 34: Multiple external receivers with different literal texts (should compile and work correctly)
    external("hello") {
        // External receiver for "hello"
    }

    external("world") {
        // External receiver for "world"
    }

    receive() {
        // Fallback empty message receiver
    }
}
