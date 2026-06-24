contract TestSend {
    receive() {
         send(SendParameters{
            bounce: true,
            to: myAddress(),
            value: ton("0.01"),
            body: "send test".asComment()
         });
    }
}
