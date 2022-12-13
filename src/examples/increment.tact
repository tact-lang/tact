message Increment {
    key: Int;
    value: Int;
}

message Toggle {
    key: Int;
}

contract IncrementContract {
    counters: map[Int]Int;
    counters2: map[Int]Bool;

    init() {
        // Nothing to do
    }

    receive(msg: Increment) {
        self.counters.set(msg.key, msg.value);
    }

    receive(msg: Toggle) {
        let ex: Bool? = self.counters2.get2(msg.key);
        if (ex == null) {
            self.counters2.set(msg.key, true);
        } else {
            self.counters2.set(msg.key, !(ex!!));
        }
    }

    get fun counters(): map[Int]Int {
        return self.counters;
    }
}