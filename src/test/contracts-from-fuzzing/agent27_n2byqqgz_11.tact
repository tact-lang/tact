message MyMsg {
    x: Int;
}

contract Consumer {
    // This contract intentionally implements no receiver, so messages sent to it will bounce
}

contract Producer {
    x: Int;

    init() {
        self.x = 123;
    }

    // Bounce receiver: triggered when outbound message bounces back
    bounced(msg: bounced<MyMsg>) {
        // For testing, we reset x
        self.x = 0;
    }

    // Regular receiver to trigger sending a message
    receive() {
        // Send a message to a Consumer contract that lacks a receiver so that the message bounces
        send(SendParameters{
            to: address("0:0000000000000000000000000000000000000000000000000000000000000000"),
            value: ton("1"),
            bounce: true,
            mode: 0,
            body: MyMsg { x: self.x }.toCell()
        });
    }
}
