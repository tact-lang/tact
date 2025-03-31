contract TestReceiverPriority {
    // Specific text receiver; should match message with literal "hello" instead of arbitrary text receiver
    receive("hello") {
    }

    // Arbitrary text receiver
    receive(str: String) {
    }
}
