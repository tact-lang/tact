contract Test {
    receive("Hello World") {
        // This receiver should only match messages with the exact text "Hello World"
    }
}
