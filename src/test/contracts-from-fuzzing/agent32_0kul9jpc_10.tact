///////////////////////////////////////////
// Test 10: Multi-contract recursive bouncing scenario
///////////////////////////////////////////

// Message used for bouncing
message Ping {
    dummy: Int;
}

///////////////////////////////////////////
// Contract: BounceChainA
// This contract sends a bounce-enabled message to a target contract and handles bounced messages
///////////////////////////////////////////

contract BounceChainA {
    target: Address;
    bouncedCount: Int;

    init(target: Address) {
        self.target = target;
        self.bouncedCount = 0;
    }

    external("start") {
        // Sends a message with bounce enabled to the target contract
        send(SendParameters{
            to: self.target,
            value: ton("1"),
            bounce: true,
            mode: 0,
            body: Ping{dummy: 123}.toCell()
        });
    }

    bounced(msg: bounced<Ping>) {
        // Increment bounce count when a bounced message is received
        self.bouncedCount = self.bouncedCount + 1;
    }
}

///////////////////////////////////////////
// Contract: BounceChainB
// This contract is intentionally left without a matching receiver for Ping messages,
// so that incoming messages bounce back to the sender
///////////////////////////////////////////

contract BounceChainB {
    // No receiver function defined: any incoming message will not be properly processed
}
