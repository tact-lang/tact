contract TestMessage() {
    // This contract tests the message() function
    receive() {
        // Send an internal message to self
        message(MessageParameters{
            to: myAddress(),
            value: ton("0.1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: null
        });
    }
}
