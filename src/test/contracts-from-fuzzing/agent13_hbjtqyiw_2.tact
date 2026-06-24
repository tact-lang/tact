contract MessageTest {
    receive() {
        message(MessageParameters{
            to: sender(),
            value: ton("0.01"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Test message".asComment()
        });
    }
}
