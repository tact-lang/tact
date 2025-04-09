struct S {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint8;
    d: Int;
}

contract SerializedStructTest {
    s: S;

    init() {
        self.s = S{ a: 15, b: -8, c: 255, d: 1000 };
    }
}
