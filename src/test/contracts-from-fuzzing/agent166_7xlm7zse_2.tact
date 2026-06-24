contract TestLiteralReceiver {
    // Receiver for specific literal text messages
    receive("hello") {
        // Action for 'hello' message
    }

    // Minimalistic receiver only
}