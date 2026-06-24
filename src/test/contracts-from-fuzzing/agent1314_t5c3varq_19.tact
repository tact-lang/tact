struct SerialOrder {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int128;
    e: Int;
}

contract SerialOrderTest {
    data: SerialOrder;

    init() {
        self.data = SerialOrder {
            a: 1,
            b: -123456,
            c: 99999999,
            d: -7,
            e: 500,
        };
    }
}