contract TestReceiverUnderscore {
    // This contract uses an underscore in the receiver parameter which should be discarded
    receive(_: String) {
        // process message without using parameter
    }
}
