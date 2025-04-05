contract TestNegativeValue() {
    receive() {
        // Attempt to send a negative value. According to documentation, coins should be non-negative.
        send(SendParameters{
            to: sender(),
            value: -ton("1"), // negative Toncoin value
            mode: SendIgnoreErrors,
            body: "Test negative value".asComment(),
            bounce: true
        });
    }
}
