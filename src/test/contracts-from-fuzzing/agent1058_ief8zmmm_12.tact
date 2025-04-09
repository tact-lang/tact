struct Ints {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
}

contract SerializedInts {
    ints: Ints;

    init() {
        self.ints = Ints{ a:1, b:2, c:3, d:4 };
    }
}