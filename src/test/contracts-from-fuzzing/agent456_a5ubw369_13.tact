struct S {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int8;
}

contract SerializedStructTest {
    s: S;

    init() {
        self.s = S {
            a: 5,
            b: 10,
            c: -7
        };
    }
}