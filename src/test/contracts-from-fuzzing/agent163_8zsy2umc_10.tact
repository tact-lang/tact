contract TestReceiverPriority {
    // This contract tests the matching priority between literal string receiver vs arbitrary text receiver
    // According to documentation, a message with comment "hello" should be handled by receive("hello") and not by receive(str: String)

    receive("hello") {
        // literal receiver
    }

    receive(str: String) {
        // generic text receiver
    }
}
