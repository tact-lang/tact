contract TestMessage {
    receive() {
        // Using the message() function to queue an outbound message
        message(MessageParameters{
            to: sender(),
            value: 0,
            bounce: false,
            body: null
        });
    }
}
