struct SerializedInts {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint128;
}

contract TestSerializedInts {
    s: SerializedInts;

    init() {
        self.s = SerializedInts{
            a: 1,
            b: -42,
            c: 123456789
        };
    }
}
