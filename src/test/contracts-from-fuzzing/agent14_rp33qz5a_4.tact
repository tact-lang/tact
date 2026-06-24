contract TestMsgNull() {
    receive() {
        // Test message() with null body
        message(MessageParameters{
            to: sender(),
            value: ton("0.1"),
            mode: SendRemainingValue,
            bounce: false,
            body: null
        });
        cashback(sender());
    }
}
