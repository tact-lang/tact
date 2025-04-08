struct SerializeInts {
    a: Int as uint32;
    b: Int as int64;
}

contract SerStorage {
    s: SerializeInts;

    init() {
        self.s = SerializeInts{ a: 1000, b: -500 };
    }
}
