message SomeMsg { data: Int; }

// Test 5: Multi-level bouncing scenario with two contracts, using proper address literal

contract ReceiverB {
    // No receivers defined, so any incoming message will fail and bounce
}

contract SenderA {
    state: Int;
    init() {
        self.state = 1;
        let dummy: Address = address("0:1111111111111111111111111111111111111111111111111111111111111111");
        // Sending a bounceable message to a dummy address (ReceiverB simulated)
        send(SendParameters{
            to: dummy,
            value: 0,
            bounce: true,
            body: SomeMsg{ data: 100 }.toCell()
        });
    }
    
    bounced(msg: bounced<SomeMsg>) {
        // Change state upon receiving a bounced message
        self.state = 2;
    }
}
