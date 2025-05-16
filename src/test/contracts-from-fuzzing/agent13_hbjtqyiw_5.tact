contract SendTestOmitBody {
    receive() {
        send(SendParameters{
            to: sender(),
            value: ton("0.01"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: null
        });
    }
}
