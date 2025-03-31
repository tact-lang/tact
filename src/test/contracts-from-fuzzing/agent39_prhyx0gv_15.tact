contract Test {
    // Receivers defined in non-documented order; should compile fine as the matching order is fixed by documentation
    receive(msg: Slice) {
        // Fallback receiver
    }

    receive(str: String) {
        // Generic text receiver
    }

    receive("hello") {
        // Specific text receiver for "hello"
    }

    receive() {
        // Empty message receiver
    }
}
