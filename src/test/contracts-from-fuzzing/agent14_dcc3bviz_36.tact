contract TestCaseSensitiveText {
    // Two receivers with distinct string literals differing in case
    receive("HELLO") {
        // Receiver for uppercase HELLO
    }

    receive("hello") {
        // Receiver for lowercase hello
    }
}
