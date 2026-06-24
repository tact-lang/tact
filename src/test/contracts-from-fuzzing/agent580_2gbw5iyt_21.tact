struct OptInts {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int? as uint32;
    d: Int? as int64;
    e: Int? as uint128;
}

contract OptIntsContract {
    fo: OptInts;

    init() {
        self.fo = OptInts {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}