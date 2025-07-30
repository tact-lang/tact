struct SerializationTest {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
}

contract SerialFields {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            a: 5,
            b: -123456789,
            c: 1000000000
        };
    }
}
