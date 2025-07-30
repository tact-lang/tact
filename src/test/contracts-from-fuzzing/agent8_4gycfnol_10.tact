message MyMsg {
    value: Int;
}

contract BounceChangeState {
    counter: Int;

    init() {
        self.counter = 0;
    }

    bounced(msg: bounced<MyMsg>) {
        // Bounce receiver that modifies state; per documentation, it's allowed because bounce receivers can modify state
        self.counter += 1;
    }
}
