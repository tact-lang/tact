message Increment {
    key: Int;
    value: Int;
}

extends mutates fun add(self: Int, value: Int) {
    self = self + value;
}

extends fun mul(self: Int, value: Int): Int {
    return self * value;
}

contract IncrementContract {
    counters: map[Int]Int;

    init() {
        // Nothing to do
    }

    receive(msg: Increment) {
        abi.dump(self);
        abi.dump(msg);
        let key: Int = msg.key;
        let v: Int = 0;
        v.add(msg.value.mul(10));
        self.counters = self.counters.set(key, v);
    }

    get fun counters(): map[Int]Int {
        return self.counters;
    }
}