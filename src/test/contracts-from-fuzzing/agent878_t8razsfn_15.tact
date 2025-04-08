struct OptIntOpts {
    a: Int? as uint4;
    b: Int? as int8;
    c: Int? as uint32;
    d: Int? as int64;
    e: Int?;
}

contract Test {
    optInts: OptIntOpts;

    init() {
        self.optInts = OptIntOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}