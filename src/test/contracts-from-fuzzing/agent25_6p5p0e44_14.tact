struct SerializeMe {
    a: Int as uint8;
    b: Int as int64;
    c: Int as int257;
    d: Int;               // implicit int257
    e: Int as uint256;
    f: Int as int1;
    g: Int as uint1;
}

contract SerialVars {
    s: SerializeMe;

    init() {
        self.s = SerializeMe{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: 0,
            g: 1,
        };
    }
}
