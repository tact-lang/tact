struct Serialized {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int64;
    f: Int as uint64;
}

contract SerializationTest {
    s: Serialized = Serialized{ a: 1, b: 2, c: 3, d: 4, e: 5, f: 6 };

    init() {
        self.s = Serialized{ a:10, b:20, c:30, d:40, e:50, f:60 };
    }
}