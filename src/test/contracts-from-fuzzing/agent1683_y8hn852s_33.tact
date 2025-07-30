struct MixSer {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
}

contract NestedMixSer {
    s: MixSer;

    init() {
        self.s = MixSer{
            a: 1, b: -2, c: 3, d: -4, e: 5
        };
    }

    receive() {
        self.s = MixSer{
            a: 10, b: -20, c: 30, d: -40, e: 50
        };
    }
}