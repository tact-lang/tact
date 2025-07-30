message MyMessage {
    counter: Int as uint8;
}

contract BounceTestTyped {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Bounce receiver that handles bounced messages of type MyMessage
    bounced(msg: bounced<MyMessage>) {
        // For testing, increment the counter using the bounced message field
        self.counter = msg.counter + 1;
    }

    // Dummy receive function so that the contract is complete
    receive() {}
}
