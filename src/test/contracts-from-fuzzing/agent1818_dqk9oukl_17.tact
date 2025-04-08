struct TestOrder {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as int8;
    f: Int as int16;
    g: Int as int32;
    h: Int as int64;
}

contract SerialOrderTest {
    data: TestOrder;

    init() {
        self.data = TestOrder{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: -1,
            f: -2,
            g: -3,
            h: -4
        };
    }
}
