struct SerializationTest {
    a: Int as int64;
    b: Int as uint8;
    c: Int as coins;
    d: Int; // default int257
    e: Bool;
    f: String;
}

contract SerContract {
    field: SerializationTest;

    init() {
        self.field = SerializationTest{
            a: -123,
            b: 255,
            c: 1000000000,
            d: 42,
            e: true,
            f: "hello"
        };
    }
}