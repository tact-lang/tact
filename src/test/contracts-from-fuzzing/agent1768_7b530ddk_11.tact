struct SerializationTest {
    a: Int as int64;
    b: Int as uint4;
    c: Int as uint248;
}

contract TestStorage {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            a: -1234567890,
            b: 8,
            c: 12345678901234567890
        };
    }
}