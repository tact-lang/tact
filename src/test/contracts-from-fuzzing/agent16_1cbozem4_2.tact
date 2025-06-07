contract TestMessage() {
    receive() {
        // Test the message() function: queue a non-deployment message with a comment as body
        message(MessageParameters{
            to: sender(),
            value: ton("1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Hello, message!".asComment(),
            bounce: true
        });
    }
}
