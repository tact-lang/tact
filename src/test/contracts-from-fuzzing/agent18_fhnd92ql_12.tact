contract Test {
    // Specific text receiver for message "hi"
    receive("hi") {
        // This should be invoked only for text messages exactly "hi"
    }

    // Arbitrary text receiver for any other text messages
    receive(str: String) {
        // This should match any text messages that do not match specific texts
    }
}
