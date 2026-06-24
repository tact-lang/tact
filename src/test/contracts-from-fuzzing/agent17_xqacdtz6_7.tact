message MyMessage {
    value: Int;
}

// Test 4: Bounce receiver with state modification
contract StateBounce {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Bounce receiver that modifies state
    bounced(msg: bounced<MyMessage>) {
        self.counter = self.counter + 1;
        return;
    }

    // Receiver to trigger bouncing scenario
    receive("bounceTest") {
        // Forward a message that is expected to bounce (assuming recipient doesn't handle MyMessage)
        self.forward(sender(), MyMessage{value: 42}.toCell(), true, null);
    }
}
