struct SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as int64;
}

contract SerializationContract {
    data: SerialTest;

    init() {
        self.data = SerialTest {
            a: 255,
            b: -32768,
            c: 15,
            d: 1234567890
        };
    }
}