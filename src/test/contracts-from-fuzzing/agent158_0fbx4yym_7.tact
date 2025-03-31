contract Test {
    receive("msg") {
        // specific text message receiver
    }
    receive(str: String) {
        // arbitrary text receiver for all other text messages
    }
}
