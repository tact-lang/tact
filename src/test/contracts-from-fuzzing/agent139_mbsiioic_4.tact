contract Test {
    // Overlapping text receiver: Specific receiver for "hello" and general text receiver.
    receive("hello") {
        // Intended to handle 'hello' specifically.
    }
    receive(str: String) {
        // Intended as fallback for arbitrary text messages.
    }
}
