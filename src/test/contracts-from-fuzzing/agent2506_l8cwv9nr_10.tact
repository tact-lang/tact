struct SerializeInts {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int64;
    d: Int;
}

contract VariedSerializationTest {
    vals: SerializeInts;

    init() {
        self.vals = SerializeInts{
            a: -5,
            b: 200,
            c: 12345678,
            d: 987654321,
        };
    }
}
