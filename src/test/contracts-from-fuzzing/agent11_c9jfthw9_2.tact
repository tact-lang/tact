contract TestMessage() {
    receive() {
        // Test use of the message() function with minimal parameters
        message(MessageParameters{
            to: sender(),
            value: ton("0.01"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "test message".asComment()
        });
    }
}
