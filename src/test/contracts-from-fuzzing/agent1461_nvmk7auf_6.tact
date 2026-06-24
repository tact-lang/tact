struct SerializationTest {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
    i: Int as int128;
    j: Int as uint128;
    k: Int as int257;
    l: Int as uint256;
}

contract SerializeContract {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            a: -10,
            b: 10,
            c: -1000,
            d: 1000,
            e: -100000,
            f: 100000,
            g: -1000000000,
            h: 1000000000,
            i: -1000000000000,
            j: 1000000000000,
            k: -1000000000000000,
            l: 1000000000000000,
        };
    }
}