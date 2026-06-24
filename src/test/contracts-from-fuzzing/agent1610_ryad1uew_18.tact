struct IntSerializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as coins;
}

contract SerializationTest {
    data: IntSerializations;

    init() {
        self.data = IntSerializations{
            a: 5,
            b: -100,
            c: 100000,
            d: 123456789
        };
    }
}