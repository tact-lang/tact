struct SerializeTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
}

contract SerializedFields {
    s: SerializeTest;
    init() {
        self.s = SerializeTest{
            a: 5,
            b: -10,
            c: 123456
        };
    }
}