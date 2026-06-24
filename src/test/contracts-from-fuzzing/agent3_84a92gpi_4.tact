message MyMessage {
    counter: Int;
}

contract BounceTest {
    res: Int;

    init() {
        self.res = 0;
    }

    bounced(msg: bounced<MyMessage>) {
        // Just acknowledging bounced message, not accessing fields
    }
}
