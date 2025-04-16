contract TestReceiverDiscard {
    // This receiver discards the String parameter using underscore
    receive(_: String) {
        // No need to use the received message
    }
}
