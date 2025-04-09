contract TestSend() {
    receive() {
        // Use the send() function to queue a message with SendParameters
        send(SendParameters{
            to: sender(),
            value: ton("1"),
            mode: SendIgnoreErrors, // skip the message in case of errors
            body: "Hello, from send()".asComment()
        });
    }
}
