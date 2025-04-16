contract TestMessage() {
    receive() {
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: null
        });
    }
}
