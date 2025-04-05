contract TestMessage() {
    receive() {
        message(MessageParameters{
            to: myAddress(),
            value: ton("0.1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Hello, message!".asComment()
        });
    }
}
