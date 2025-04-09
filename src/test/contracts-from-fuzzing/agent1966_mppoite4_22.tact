struct SerialTest {
    a: Int as int32;
    b: Int as uint32;
    c: Int as int128;
    d: Int as uint128;
}

contract Serializations {
    f: SerialTest;

    init() {
        self.f = SerialTest{
            a: -10,
            b: 100,
            c: -100000,
            d: 100000
        };
    }
}