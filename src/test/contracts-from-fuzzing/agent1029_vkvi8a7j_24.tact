struct Serializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
}

contract SerializationTest {
    ser: Serializations;

    init() {
        self.ser = Serializations{
            a: 255,
            b: -32768,
            c: 12345678901234,
            d: -1
        };
    }
}