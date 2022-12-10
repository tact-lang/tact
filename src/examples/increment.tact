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
        // msg.key.add(msg.value.mul(10));
        self.counters.set(msg.key, msg.value);
    }

    get fun counters(): map[Int]Int {
        return self.counters;
    }
}