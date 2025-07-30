message BounceMsg {
    num: Int;
}

// Contract A sends a message with bounce: true to contract B.
contract ContractA {
    b_address: Address;
    counter: Int;

    init(addr: Address) {
        self.b_address = addr;
        self.counter = 0;
    }

    // When receiving any message, send BounceMsg to ContractB
    receive() {
        send(SendParameters{
            to: self.b_address,
            value: 0,
            bounce: true,
            mode: 0,
            body: BounceMsg{ num: 1 }.toCell()
        });
    }

    // Bounce receiver: called when the outgoing message bounces back
    bounced(msg: bounced<BounceMsg>) {
        // Increase a counter to record bounce reception
        self.counter = self.counter + 1;
    }
}

// ContractB purposely fails on receiving BounceMsg to trigger a bounce
contract ContractB {
    receive(msg: BounceMsg) {
        // Fail intentionally to force bounce
        require(false, "Intentional failure in ContractB");
    }

    // Providing a bounce receiver as well (optional)
    bounced(_msg: bounced<BounceMsg>) {
        // Could log bounce info if needed
    }
}
