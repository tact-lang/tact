contract TestSendCorrect() {
    receive() {
        send(SendParameters{
            to: sender(),
            value: ton("0.1"),
            mode: SendPayGasSeparately,
            bounce: false,
            body: "send test".asComment()
        });
    }
}
