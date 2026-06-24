struct SerializeTest {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint64;
    d: Int; // default int257
}

contract Serialization {
    data: SerializeTest;
    init() {
        self.data = SerializeTest{
            a: 7,
            b: -8,
            c: 123456789,
            d: -1,
        };
    }
}