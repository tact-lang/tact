struct SerializationTest {
    a: Int as int32;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint64;
}

contract SerializationContract {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            a: -123,
            b: 123,
            c: -456,
            d: 456
        };
    }
}