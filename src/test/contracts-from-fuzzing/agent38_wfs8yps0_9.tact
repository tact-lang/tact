message Ping {
    value: Int as uint8;
}

contract B {
    // This contract deliberately fails when receiving any message to trigger a bounce
    receive() {
        // Force failure
        require(false, "B failure");
    }
}

contract A {
    b_addr: Address;
    counter: Int;

    init(b: Address) {
        self.b_addr = b;
        self.counter = 0;
    }

    receive() {
        // Send a Ping message to contract B with bounce enabled
        send(SendParameters{
            to: self.b_addr,
            value: 0,
            bounce: true,
            mode: 0,
            body: Ping{ value: 99 }.toCell()
        });
    }

    // Bounce receiver: will be triggered if the message sent to contract B bounces back
    bounced(msg: bounced<Ping>) {
        // Update state on bounce
        self.counter = msg.value;
    }
}
