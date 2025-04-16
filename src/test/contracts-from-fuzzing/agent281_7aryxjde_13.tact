struct SerialOpts {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint64;
    e: Int as coins;
}

contract SerialVars {
    s: SerialOpts;

    init() {
        self.s = SerialOpts{
            a: -5,
            b: 250,
            c: 1_000_000,
            d: 2_000_000,
            e: 1000
        };
    }
}