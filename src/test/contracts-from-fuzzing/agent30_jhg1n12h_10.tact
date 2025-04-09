// Testing multi-level bouncing scenario: Sender sends a bounceable message to a Receiver contract that does not support the message type for "ping".

// Define a minimal message type that fits into bounced message size limits
message SmallMsg {
    // Using a small native type: 4-bit integer candidate. But since there's no 'Int4', we use default Int and assume small value.
    num: Int;
}

// Receiver contract intentionally does not implement a matching receive() function to trigger a bounce
contract BounceReceiverMissing {
    // No receive specialized function is declared.
}

// Sender contract which sends a message to BounceReceiverMissing and handles bounced message
contract BounceSender {
    receiver: Address;
    bouncedFlag: Bool;

    init(receiver: Address) {
        self.receiver = receiver;
        self.bouncedFlag = false;
    }

    // A receive function to trigger sending a bounceable message
    receive("ping") {
        // Sending SmallMsg with bounce flag set to true
        self.forward(self.receiver, SmallMsg{ num: 7 }.toCell(), true, null);
    }

    // Typed bounced receiver: activated when the previously sent message bounces back
    bounced(msg: bounced<SmallMsg>) {
        // Mark that a bounced message was received
        self.bouncedFlag = true;
    }
}

// Additionally, testing fallback bounced receiver that handles all bounced messages as raw Slice
contract BounceFallbackTest {
    flag: Int;

    init() {
        self.flag = 0;
    }

    // Send a bounceable message
    receive("go") {
        // Here, using sender() as receiver for illustration; in real case, one might send to a contract that fails
        self.forward(sender(), SmallMsg{ num: 3 }.toCell(), true, null);
    }

    // Fallback bounced receiver which will handle any bounced message regardless of its type
    bounced(raw: Slice) {
        // For testing purposes, simply set flag to a constant to indicate bounce reception
        self.flag = 99;
    }
}
