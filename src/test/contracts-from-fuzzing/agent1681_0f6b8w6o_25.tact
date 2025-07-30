struct IntSer {
    x: Int as int64;
    y: Int as uint64;
}

contract MixedSer {
    s: IntSer;
    init() {
        self.s = IntSer{ x: 1, y: 2 };
    }
    receive() {
        self.s = self.s;
    }
}