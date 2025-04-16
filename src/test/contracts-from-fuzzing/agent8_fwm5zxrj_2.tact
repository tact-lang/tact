contract TestMessage {
    receive() {
        message(MessageParameters{
            to: sender(),
            value: ton("0.1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "hello".asComment()
        });
        cashback(sender());
    }
}