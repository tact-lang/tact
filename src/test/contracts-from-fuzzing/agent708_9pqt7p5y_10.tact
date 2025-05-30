struct SerOrder {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Int; // default 257 bit signed
}

contract SerializedFields {
    s: SerOrder;

    init() {
        self.s = SerOrder{
            a: 1,
            b: -1,
            c: 10000,
            d: -10000
        };
    }
}
