message Inrement {
    key: Int;
    value: Int;
}

contract IncrementContract {
    counters: map[Int]Int;

    init() {
        // Nothing to do
    }

    receive(msg: Inrement) {
        abi.dump(self);
        abi.dump(msg);
        let key: Int = msg.key;
        self.counters = self.counters.set(key, msg.value);
    }

    get fun counters(): map[Int]Int {
        return self.counters;
    }
}