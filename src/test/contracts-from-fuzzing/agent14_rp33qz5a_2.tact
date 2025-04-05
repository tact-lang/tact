contract TestMessage() {
    receive() {
        // Test the standard library function message()
        message(MessageParameters{
            to: sender(),
            value: ton("0.01"),
            mode: SendRemainingValue | SendIgnoreErrors,
            bounce: true,
            body: "hello from TestMessage".asComment()
        });
        // Ensure the receiver compiles by calling cashback
        cashback(sender());
    }
}
