contract Test {
    // Receiver for specific text literal "hello"
    receive("hello") {
        return;
    }

    // Generic receiver for arbitrary text messages
    receive(str: String) {
        return;
    }
}
