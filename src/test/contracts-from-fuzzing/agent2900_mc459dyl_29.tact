struct S {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as int1;
}

contract SerializationTest {
    val: S;

    init() {
        self.val = S{ a:5, b:-7, c: 9, d: -1 };
    }
}
