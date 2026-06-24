message BounceMsg {
    value: Int as coins;
}

contract BounceTest {
    counter: Int;

    init() {
        self.counter = 0;
    }

    bounced(msg: bounced<BounceMsg>) {
        self.counter = msg.value;
    }

    receive() {}
}
