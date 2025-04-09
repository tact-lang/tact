contract TestTextReceiver {
    // Test for text comment specific receiver
    receive("hello") {
        // Code for specific text message matching "hello"
    }
}
