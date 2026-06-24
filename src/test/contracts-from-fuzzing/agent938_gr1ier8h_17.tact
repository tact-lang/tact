struct SerialOrderTest {
    a: Int as uint8;
    b: Bool;
    c: Int as uint32;
    d: Bool;
    e: Int as uint64;
}

contract SerializeOrder {
    f: SerialOrderTest;

    init() {
        self.f = SerialOrderTest{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: 3,
        };
    }
}
