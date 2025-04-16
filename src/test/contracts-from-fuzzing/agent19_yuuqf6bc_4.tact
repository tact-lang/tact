contract TestSend() {
    receive() {
        // Test the send() function using SendParameters instead of MessageParameters
        send(SendParameters {
            to: myAddress(),
            value: ton("0.01"),
            mode: SendRemainingValue,
            body: "TestSend".asComment()
        });
    }
}
