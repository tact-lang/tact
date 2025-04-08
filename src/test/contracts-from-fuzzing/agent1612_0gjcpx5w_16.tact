struct SerialOrder {
    a: Int as uint4;
    b: Int as uint64;
    c: Int as uint8;
    d: Int as int256;
}

contract SerialChecks {
    data: SerialOrder;

    init() {
        self.data = SerialOrder{
            a: 9,
            b: 123456,
            c: 255,
            d: -10,
        };
    }
}
