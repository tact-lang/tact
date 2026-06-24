struct SerializationTest {
    a: Int as int64;
    b: Bool;
    c: Int as uint8;
    d: Int as int256;
}

contract SerializationStructTest {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            a: 1,
            b: true,
            c: 255,
            d: -123456789
        };
    }
}
