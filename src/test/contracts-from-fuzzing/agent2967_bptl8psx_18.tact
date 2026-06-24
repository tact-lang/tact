struct IntSerial {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
}

contract SerializationTest {
    ser: IntSerial;

    init() {
        self.ser = IntSerial{
            a: 255,
            b: -42,
            c: 123456
        };
    }
}