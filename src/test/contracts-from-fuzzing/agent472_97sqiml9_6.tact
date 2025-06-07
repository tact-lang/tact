struct SerializedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int;
}

contract TestS {
    vals: SerializedInts;
    init() {
        self.vals = SerializedInts{ a: 1, b: 2, c: 3, d: 4 };
    }
}