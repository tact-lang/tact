struct Ints {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerializedInts {
    f: Ints;

    init() {
        self.f = Ints{ a:1, b:2, c:3 };
    }
}