message RecBounceMsg {
    count: Int as uint64;
}

contract BounceRecursive5 {
    state: Int as uint64;
    self_addr: Address;

    init() {
        self.self_addr = address("0:deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef");
        self.state = 0;
        // Start the bounce recursion with count = 1
        send(SendParameters{
            to: self.self_addr,
            value: 0,
            bounce: true,
            body: RecBounceMsg{ count: 1 }.toCell()
        });
    }

    bounced(msg: bounced<RecBounceMsg>) {
        // Check that the count field fits in uint64 (should be less than 3 for this test to continue)
        if (msg.count < 3) {
            send(SendParameters{
                to: self.self_addr,
                value: 0,
                bounce: true,
                body: RecBounceMsg{ count: msg.count + 1 }.toCell()
            });
        }
        self.state = msg.count;
    }
}
