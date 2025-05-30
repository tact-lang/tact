contract TesterSend() {
    receive() {
        // Test send() function: send a message to the sender with 1 Toncoin attached and a simple comment
        send(SendParameters{
            to: sender(),
            value: ton("1"),
            mode: SendIgnoreErrors, // skip errors during outbound message processing
            body: "Test send message".asComment()
        });
        // Use cashback() to return any remaining balance
        cashback(sender());
    }
}
