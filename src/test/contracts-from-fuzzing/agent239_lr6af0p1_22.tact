struct SerialOrder {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint64;
    d: Int as int128;
    e: Int;
}

contract SerializationOrderContract {
    f: SerialOrder;

    init() {
        self.f = SerialOrder{ a:1, b:2, c:3, d:4, e:5 };
    }
}