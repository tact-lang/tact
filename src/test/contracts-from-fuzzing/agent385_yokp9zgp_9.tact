struct SerializeTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
}

contract SerializationFields {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            a: 7,
            b: -1000,
            c: ton("1")
        };
    }
}