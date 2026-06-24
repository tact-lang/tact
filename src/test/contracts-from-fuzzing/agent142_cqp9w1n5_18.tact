contract Test {
    // External receiver function: messages with literal comment "hello external"
    external("hello external") {
        // Accept message explicitly for external messages
        acceptMessage();
    }
}
