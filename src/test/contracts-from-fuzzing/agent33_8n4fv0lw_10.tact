message MyMessage {
    // Empty message to fit within the 224-bit limit
}

contract BounceReceiver4 {
    state: Int;

    init() {
        self.state = 0;
    }

    bounced(msg: bounced<MyMessage>) {
        // Simply increment state regardless of the message content
        self.state = self.state + 1;
    }
}
