contract TestSend() {
    receive() {
        send(SendParameters{
            to: myAddress(),
            value: ton("0.1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Hello from send".asComment(),
        });
    }
}
