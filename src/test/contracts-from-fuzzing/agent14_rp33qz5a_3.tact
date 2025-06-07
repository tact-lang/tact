contract TestSend() {
    receive() {
        send(SendParameters{
            to: sender(),
            value: ton("1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Test Send".asComment()
        });
        cashback(sender());
    }
}
