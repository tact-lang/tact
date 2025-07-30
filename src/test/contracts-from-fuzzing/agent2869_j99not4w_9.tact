struct Packed {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as uint128;
}

contract SerializationTest {
    data: Packed;

    init() {
        self.data = Packed{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
        };
    }
}
