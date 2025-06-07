contract TestLiteralReceiver {
    // Receiver for a literal text message
    receive("hello") {
        // no operation
    }
}
