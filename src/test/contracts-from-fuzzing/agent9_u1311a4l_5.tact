message MyMessage {
    value: Int;
}

contract TestBounceState {
    counter: Int;

    init() {
        self.counter = 0;
    }

    bounced(msg: bounced<MyMessage>) {
        // In bounced receiver, state modifications are allowed.
        self.counter = self.counter + 1;
    }
}
