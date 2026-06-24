struct SerializationTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint4;
}

contract TestSerialization {
    val: SerializationTest;

    init() {
        self.val = SerializationTest{
            a: 5,
            b: -1234,
            c: 123456,
            d: -922337203685477580,
            e: 7
        };
    }
}