contract NoBounceReceiver {
    target: Address;

    init(target: Address) {
        self.target = target;
    }

    // Standard receive function sending a bounceable message without a bounce receiver
    receive() {
        send(SendParameters{
            to: self.target,
            value: 0,
            bounce: true,
            mode: 0,
            body: "Test bounce message".asComment()
        });
    }
}
