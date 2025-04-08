struct SerializationTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as int257;
}

contract SerializationEdgeCase {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            a: 255,
            b: -32768,
            c: 4294967295,
            d: -9223372036854775808,
            e: 0
        };
    }
}
