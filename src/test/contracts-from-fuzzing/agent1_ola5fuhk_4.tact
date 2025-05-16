contract TestSendDefaultMode() {
    receive() {
        // Using send() without explicitly specifying mode, relying on default values
        send(SendParameters{
            to: sender(),
            value: ton("0.1")
            // bounce is true by default, mode is not specified
        });
    }
}
