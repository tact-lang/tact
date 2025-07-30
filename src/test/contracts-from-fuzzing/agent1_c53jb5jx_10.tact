// Test receiving an empty message (no arguments in receive)
contract EmptyReceiver {
    received: Bool;

    init() {
        self.received = false;
    }

    receive() { // Receive an empty message (no string literal, no message type)
        self.received = true;
    }
}