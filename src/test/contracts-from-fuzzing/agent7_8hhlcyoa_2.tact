message MyMessage {
    data: Int as uint64;
}

contract BounceTest2 {
    value: Int;

    init() {
        self.value = 0;
    }

    // bounced message receiver that should be invoked when an outgoing message bounces back.
    bounced(msg: bounced<MyMessage>) {
        self.value = msg.data;
    }
}
