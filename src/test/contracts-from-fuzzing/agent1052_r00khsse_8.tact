struct SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract SerializationContract {
    data: SerialTest;

    init() {
        self.data = SerialTest{
            a: 1,
            b: -1234,
            c: 100000,
            d: -500000
        };
    }
}