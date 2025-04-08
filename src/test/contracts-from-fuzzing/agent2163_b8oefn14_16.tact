struct SerializeTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
    d: Int as uint64;
}

contract SerializationFields {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            a: 1,
            b: 2,
            c: 3,
            d: 4
        };
    }
}