contract Test {
    // Test 9: Overlapping text message receivers: specific text vs arbitrary text
    receive("hello") {
        // should match only text "hello"
    }

    receive(str: String) {
        // catch-all text receiver
    }

    // Dummy receiver to be used to ensure contract compiles
    receive() {
        // empty message receiver
    }
}
