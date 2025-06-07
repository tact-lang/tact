struct OrderedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int257;
    d: Int as uint32;
}

contract IntOrderTest {
    data: OrderedInts;

    init() {
        self.data = OrderedInts{
            a: 5,
            b: -100,
            c: 1234,
            d: 42,
        };
    }
}
