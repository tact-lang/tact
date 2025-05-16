message MyMessage {
    data: Int;
}

// Bounce receiver that uses self.reply inside bounce receiver (recursive bounce behavior)
contract BounceRecursive {
    bounced(msg: bounced<MyMessage>) {
        // Access sender and send a reply inside bounce receiver
        let s = sender();
        // This self.reply call sends a message back to s
        self.reply("bounce reply".asComment());
    }
}

// Bounce receiver that uses self.notify to send non-bouncing message after state update
contract BounceStateNotify {
    counter: Int;

    init() {
        self.counter = 0;
    }

    bounced(msg: bounced<MyMessage>) {
        // Update state upon receiving a bounced message
        self.counter = self.counter + 1;
        // Send a non-bounceable notification back
        self.notify("non-bounce reply".asComment());
    }
}
