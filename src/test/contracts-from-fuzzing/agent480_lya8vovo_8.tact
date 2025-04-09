struct SerialTest {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;
}

contract SerializationFields {
    x: SerialTest;

    init() {
        self.x = SerialTest{
            a: 255,
            b: 65535,
            c: 4294967295,
            d: 9223372036854775807,
            e: ton("1"),
        };
    }
}