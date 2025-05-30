message BounceMsg {
    value: Int as coins;
}

contract ModifyStateBounceFixed {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Bounce receiver that modifies contract state by adding the bounced value
    bounced(msg: bounced<BounceMsg>) {
        self.counter = self.counter + msg.value;
    }
}
