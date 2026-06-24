contract TestDiscardStr {
    // Using underscore to discard message parameter for arbitrary text messages
    receive(_: String) {
        // Handler ignoring the text content
    }
}
