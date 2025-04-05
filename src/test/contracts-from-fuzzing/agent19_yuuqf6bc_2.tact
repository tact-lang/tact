contract TestMessage() {
    receive() {
        // Test message() function by sending a message to self
        message(MessageParameters {
            to: myAddress(),
            value: ton("0.01"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Hello from TestMessage".asComment()
        });
    }
}
