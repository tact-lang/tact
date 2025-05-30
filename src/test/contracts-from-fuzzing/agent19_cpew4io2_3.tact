message BounceMsg {
    info: String;
}

contract BounceTest3 {
    counter: Int;

    init() {
        self.counter = 0;
    }

    receive() {
        self.counter += 1;
        // Sending a message that may bounce
        send(SendParameters{
            to: sender(),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: BounceMsg{ info: "Sending bounce" }.toCell()
        });
    }

    bounced(msg: bounced<BounceMsg>) {
        // Reset counter on bounce
        self.counter = 0;
    }
}
