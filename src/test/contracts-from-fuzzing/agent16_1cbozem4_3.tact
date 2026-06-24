contract TestSend() {
    receive() {
        // Use send() to send a minimal message with a comment payload.
        send(SendParameters{
            to: sender(),
            value: ton("1"),
            mode: SendRemainingValue,
            body: "Test send".asComment(),
            code: null,
            data: null,
            bounce: true
        });
    }
}
