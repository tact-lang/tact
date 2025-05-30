contract Test8 {
    receive("increment") {
        // Specific text message receiver for "increment"
    }
    receive(str: String) {
        // Arbitrary text message receiver
    }
}
