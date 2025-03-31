contract Test {
    // Specific text comment receiver (matches incoming message "hello")
    receive("hello") {
    }

    // A second receiver using a different text literal to avoid ambiguity and test matching order
    receive("world") {
    }
}
