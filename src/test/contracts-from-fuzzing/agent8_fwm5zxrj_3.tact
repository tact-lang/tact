contract TestSend {
    receive() {
        send(SendParameters{
            to: sender(),
            value: ton("0.1"),
            mode: SendIgnoreErrors, // send, ignoring errors
            body: "Test send".asComment()
        });
        cashback(sender());
    }
}
