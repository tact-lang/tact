struct SerializeCombo {
    a: Int as uint1;
    b: Int as int1;
    c: Int as uint8;
    d: Int as int64;
    e: Int;
    f: Int as uint256;
}

contract TestSerializeCombo {
    s: SerializeCombo;

    init() {
        self.s = SerializeCombo{
            a: 1,
            b: -1,
            c: 255,
            d: -9223372036854775808,
            e: 0,
            f: 0
        };
    }
}