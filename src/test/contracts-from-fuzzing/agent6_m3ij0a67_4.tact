message CombinedMsg { data: Int; }

contract BounceAndReceive {
    counter: Int = 0;

    receive("inc") {
        self.counter += 1;
    }

    bounced(msg: bounced<CombinedMsg>) {
        self.counter = 0;
    }
}
