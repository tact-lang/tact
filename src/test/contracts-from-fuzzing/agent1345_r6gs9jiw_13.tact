struct IntSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
}

contract IntSerializeTest {
    data: IntSerialization;

    init() {
        self.data = IntSerialization{
            a: 255,
            b: -12345,
            c: 1234567890
        };
    }
}