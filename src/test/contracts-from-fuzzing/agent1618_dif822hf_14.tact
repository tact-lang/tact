struct SerializationTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int? as uint32;
    d: Int? as int64;
}

contract TestContract {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            a: 255,
            b: -30000,
            c: null,
            d: 123456789
        };
    }
}