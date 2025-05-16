message BounceMsg {
    dummy: Int;
}

contract TestReceiver {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Internal message receiver for "incr"
    receive("incr") {
        self.counter += 1;
    }

    // Bounced message receiver using a valid message type
    bounced(src: bounced<BounceMsg>) {
        self.counter = 0;
    }

    // External message receiver for "reset"
    external("reset") {
        self.counter = 0;
    }
}
