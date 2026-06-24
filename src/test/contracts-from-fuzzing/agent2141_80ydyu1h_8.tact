struct SerializationTest {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
}

contract TestContract {
    s: SerializationTest;

    init() {
        self.s = SerializationTest{
            a: -128,
            b: 255,
            c: -32000,
            d: 65000,
            e: -2000000000,
            f: 4000000000
        };
    }
}